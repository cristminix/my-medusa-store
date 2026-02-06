import { AbstractPaymentProvider, MedusaError } from "@medusajs/framework/utils"
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
} from "@medusajs/framework/types"

type WireTransferOptions = {
  // Bank account details to display to customers
  bank_name: string
  account_number: string
  account_holder: string
  // Optional: SWIFT/BIC code for international transfers
  swift_code?: string
  // Optional: Additional instructions
  instructions?: string
}

type InjectedDependencies = {
  logger: Logger
}

class WireTransferPaymentProviderService extends AbstractPaymentProvider<WireTransferOptions> {
  static identifier = "wire-transfer"

  protected logger_: Logger
  protected options_: WireTransferOptions

  constructor(container: InjectedDependencies, options: WireTransferOptions) {
    super(container, options)
    this.logger_ = container.logger
    this.options_ = options
  }

  static validateOptions(options: Record<string, unknown>): void | never {
    if (!options.bank_name) {
      throw new MedusaError(
        MedusaError.Types.INVALID_DATA,
        "bank_name is required for wire transfer provider"
      )
    }
    if (!options.account_number) {
      throw new MedusaError(
        MedusaError.Types.INVALID_DATA,
        "account_number is required for wire transfer provider"
      )
    }
    if (!options.account_holder) {
      throw new MedusaError(
        MedusaError.Types.INVALID_DATA,
        "account_holder is required for wire transfer provider"
      )
    }
  }

  async initiatePayment(
    input: InitiatePaymentInput
  ): Promise<InitiatePaymentOutput> {
    const { amount, currency_code } = input

    const sessionId = `wt_${Date.now()}_${Math.random().toString(36).substring(7)}`

    this.logger_.info(
      `[Wire Transfer] Initiated payment session ${sessionId} for ${amount} ${currency_code}`
    )

    // Return bank details for the customer to make the transfer
    return {
      id: sessionId,
      data: {
        id: sessionId,
        amount: Number(amount),
        currency_code,
        status: "pending",
        bank_details: {
          bank_name: this.options_.bank_name,
          account_number: this.options_.account_number,
          account_holder: this.options_.account_holder,
          swift_code: this.options_.swift_code,
          instructions: this.options_.instructions,
        },
        created_at: new Date().toISOString(),
      },
    }
  }

  async authorizePayment(
    input: AuthorizePaymentInput
  ): Promise<AuthorizePaymentOutput> {
    const { data } = input

    this.logger_.info(`[Wire Transfer] Authorized payment ${data?.id}`)

    // Wire transfer payments require manual verification
    // Return "pending" status until admin confirms the transfer was received
    return {
      status: "pending",
      data: {
        ...data,
        status: "pending",
        note: "Awaiting wire transfer confirmation",
        authorized_at: new Date().toISOString(),
      },
    }
  }

  async capturePayment(
    input: CapturePaymentInput
  ): Promise<CapturePaymentOutput> {
    const { data } = input

    this.logger_.info(`[Wire Transfer] Captured payment ${data?.id}`)

    // Admin confirms the wire transfer was received
    return {
      data: {
        ...data,
        status: "captured",
        captured_at: new Date().toISOString(),
      },
    }
  }

  async refundPayment(input: RefundPaymentInput): Promise<RefundPaymentOutput> {
    const { data, amount } = input

    this.logger_.info(
      `[Wire Transfer] Refunded payment ${data?.id} for amount ${amount}`
    )

    // Refunds are processed manually via bank transfer
    return {
      data: {
        ...data,
        status: "refunded",
        refunded_amount: amount,
        refunded_at: new Date().toISOString(),
      },
    }
  }

  async cancelPayment(input: CancelPaymentInput): Promise<CancelPaymentOutput> {
    const { data } = input

    this.logger_.info(`[Wire Transfer] Cancelled payment ${data?.id}`)

    return {
      data: {
        ...data,
        status: "cancelled",
        cancelled_at: new Date().toISOString(),
      },
    }
  }

  async deletePayment(input: DeletePaymentInput): Promise<DeletePaymentOutput> {
    return {}
  }

  async updatePayment(input: UpdatePaymentInput): Promise<UpdatePaymentOutput> {
    const { data, amount, currency_code } = input

    return {
      data: {
        ...data,
        amount: Number(amount),
        currency_code,
        updated_at: new Date().toISOString(),
      },
    }
  }

  async retrievePayment(
    input: RetrievePaymentInput
  ): Promise<RetrievePaymentOutput> {
    const { data } = input

    return {
      data: data || {},
    }
  }

  async getPaymentStatus(
    input: GetPaymentStatusInput
  ): Promise<GetPaymentStatusOutput> {
    const { data } = input

    // Return the status stored in data, default to pending
    const status = (data?.status as PaymentSessionStatus) || "pending"

    return {
      status,
    }
  }

  async getWebhookActionAndData(
    payload: ProviderWebhookPayload["payload"]
  ): Promise<WebhookActionResult> {
    // Wire transfer doesn't use webhooks
    return {
      action: "not_supported",
    }
  }
}

export default WireTransferPaymentProviderService
