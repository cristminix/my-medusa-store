import {
  AbstractPaymentProvider,
  MedusaError,
} from "@medusajs/framework/utils";
import {
  Logger,
  InitiatePaymentInput,
  InitiatePaymentOutput,
  AuthorizePaymentInput,
  AuthorizePaymentOutput,
  CapturePaymentInput,
  CapturePaymentOutput,
  RefundPaymentInput,
  RefundPaymentOutput,
  CancelPaymentInput,
  CancelPaymentOutput,
  DeletePaymentInput,
  DeletePaymentOutput,
  UpdatePaymentInput,
  UpdatePaymentOutput,
  RetrievePaymentInput,
  RetrievePaymentOutput,
  ProviderWebhookPayload,
  WebhookActionResult,
  GetPaymentStatusInput,
  GetPaymentStatusOutput,
  PaymentSessionStatus,
} from "@medusajs/framework/types";

type CodOptions = {
  // Optional: Maximum order amount allowed for COD
  max_amount?: number;
  // Optional: COD fee to be added
  cod_fee?: number;
};

type InjectedDependencies = {
  logger: Logger;
};

class CodPaymentProviderService extends AbstractPaymentProvider<CodOptions> {
  static identifier = "cod";

  protected logger_: Logger;
  protected options_: CodOptions;

  constructor(container: InjectedDependencies, options: CodOptions) {
    super(container, options);
    this.logger_ = container.logger;
    this.options_ = options || {};
  }

  static validateOptions(options: Record<string, unknown>): void | never {
    // COD doesn't require any mandatory options
    // But validate max_amount and cod_fee if provided
    if (
      options.max_amount !== undefined &&
      typeof options.max_amount !== "number"
    ) {
      throw new MedusaError(
        MedusaError.Types.INVALID_DATA,
        "max_amount must be a number",
      );
    }
    if (options.cod_fee !== undefined && typeof options.cod_fee !== "number") {
      throw new MedusaError(
        MedusaError.Types.INVALID_DATA,
        "cod_fee must be a number",
      );
    }
  }

  async initiatePayment(
    input: InitiatePaymentInput,
  ): Promise<InitiatePaymentOutput> {
    const { amount, currency_code } = input;

    // Check max amount if configured
    const amountNum = Number(amount);
    if (this.options_.max_amount && amountNum > this.options_.max_amount) {
      throw new MedusaError(
        MedusaError.Types.NOT_ALLOWED,
        `Cash on Delivery is not available for orders above ${this.options_.max_amount} ${currency_code}`,
      );
    }

    const sessionId = `cod_${Date.now()}_${Math.random().toString(36).substring(7)}`;

    this.logger_.info(
      `[COD] Initiated payment session ${sessionId} for ${amount} ${currency_code}`,
    );

    return {
      id: sessionId,
      data: {
        id: sessionId,
        amount: amountNum,
        currency_code,
        cod_fee: this.options_.cod_fee || 0,
        status: "pending",
        created_at: new Date().toISOString(),
      },
    };
  }

  async authorizePayment(
    input: AuthorizePaymentInput,
  ): Promise<AuthorizePaymentOutput> {
    const { data } = input;

    this.logger_.info(`[COD] Authorized payment ${data?.id}`);

    // COD payments are automatically authorized since payment is collected on delivery
    /*
    data: {
      ...data,
      status: "pending",
      note: "Awaiting wire transfer confirmation",
      status: "awaiting_transfer",
      note: "Awaiting wire transfer confirmation from customer",
      authorized_at: new Date().toISOString(),
    },
    */
    return {
      status: "authorized",
      data: {
        ...data,
        status: "awaiting_payment",
        note: "Awaiting payment from customer",
        authorized_at: new Date().toISOString(),
      },
    };
  }

  async capturePayment(
    input: CapturePaymentInput,
  ): Promise<CapturePaymentOutput> {
    const { data } = input;

    this.logger_.info(`[COD] Captured payment ${data?.id}`);

    // Mark as captured when the delivery person confirms payment receipt
    return {
      data: {
        ...data,
        status: "captured",
        captured_at: new Date().toISOString(),
      },
    };
  }

  async refundPayment(input: RefundPaymentInput): Promise<RefundPaymentOutput> {
    const { data, amount } = input;

    this.logger_.info(
      `[COD] Refunded payment ${data?.id} for amount ${amount}`,
    );

    // For COD, refunds are handled manually (cash returned to customer)
    return {
      data: {
        ...data,
        status: "refunded",
        refunded_amount: amount,
        refunded_at: new Date().toISOString(),
      },
    };
  }

  async cancelPayment(input: CancelPaymentInput): Promise<CancelPaymentOutput> {
    const { data } = input;

    this.logger_.info(`[COD] Cancelled payment ${data?.id}`);

    return {
      data: {
        ...data,
        status: "cancelled",
        cancelled_at: new Date().toISOString(),
      },
    };
  }

  async deletePayment(input: DeletePaymentInput): Promise<DeletePaymentOutput> {
    // Nothing to delete for COD
    return {};
  }

  async updatePayment(input: UpdatePaymentInput): Promise<UpdatePaymentOutput> {
    const { data, amount, currency_code } = input;

    // Check max amount if configured
    const amountNum = Number(amount);
    if (
      this.options_.max_amount &&
      amount &&
      amountNum > this.options_.max_amount
    ) {
      throw new MedusaError(
        MedusaError.Types.NOT_ALLOWED,
        `Cash on Delivery is not available for orders above ${this.options_.max_amount} ${currency_code}`,
      );
    }

    return {
      data: {
        ...data,
        amount: amountNum,
        currency_code,
        updated_at: new Date().toISOString(),
      },
    };
  }

  async retrievePayment(
    input: RetrievePaymentInput,
  ): Promise<RetrievePaymentOutput> {
    const { data } = input;

    // Return the stored payment data
    return {
      data: data || {},
    };
  }

  async getPaymentStatus(
    input: GetPaymentStatusInput,
  ): Promise<GetPaymentStatusOutput> {
    const { data } = input;

    // Return the status stored in data, default to pending
    const status = (data?.status as PaymentSessionStatus) || "pending";

    return {
      status,
    };
  }

  async getWebhookActionAndData(
    payload: ProviderWebhookPayload["payload"],
  ): Promise<WebhookActionResult> {
    // COD doesn't use webhooks
    return {
      action: "not_supported",
    };
  }
}

export default CodPaymentProviderService;
