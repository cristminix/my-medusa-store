import { AbstractFulfillmentProviderService } from "@medusajs/framework/utils"
import {
  CalculateShippingOptionPriceDTO,
  CalculatedShippingOptionPrice,
  CreateFulfillmentResult,
  FulfillmentDTO,
  FulfillmentItemDTO,
  FulfillmentOption,
  FulfillmentOrderDTO,
  Logger,
} from "@medusajs/framework/types"

type InternalShippingOptions = {
  /**
   * Base shipping cost (in cents/smallest currency unit)
   */
  base_rate: number
  /**
   * Cost per kilogram (in cents/smallest currency unit)
   */
  rate_per_kg: number
}

type InjectedDependencies = {
  logger: Logger
}

class InternalShippingProviderService extends AbstractFulfillmentProviderService {
  static identifier = "internal-shipping"

  private options: InternalShippingOptions
  private logger: Logger

  constructor(
    { logger }: InjectedDependencies,
    options: InternalShippingOptions
  ) {
    super()
    this.logger = logger
    this.options = {
      base_rate: options.base_rate ?? 1000, // Default 1000 cents = 10.00
      rate_per_kg: options.rate_per_kg ?? 500, // Default 500 cents = 5.00 per kg
    }
  }

  async getFulfillmentOptions(): Promise<FulfillmentOption[]> {
    return [
      {
        id: "internal-standard",
        name: "Standard Shipping (Weight-Based)",
      },
      {
        id: "internal-express",
        name: "Express Shipping (Weight-Based)",
      },
    ]
  }

  async validateFulfillmentData(
    optionData: Record<string, unknown>,
    data: Record<string, unknown>,
    context: Record<string, unknown>
  ): Promise<Record<string, unknown>> {
    return data
  }

  async validateOption(data: Record<string, unknown>): Promise<boolean> {
    return true
  }

  async canCalculate(data: Record<string, unknown>): Promise<boolean> {
    return true
  }

  async calculatePrice(
    optionData: CalculateShippingOptionPriceDTO["optionData"],
    data: CalculateShippingOptionPriceDTO["data"],
    context: CalculateShippingOptionPriceDTO["context"]
  ): Promise<CalculatedShippingOptionPrice> {
    const items = context.items || []

    // Calculate total weight from all items (weight in grams, convert to kg)
    const totalWeightGrams = items.reduce((sum, item) => {
      const weight = (item.variant?.weight as number) || 0
      const quantity = item.quantity || 1
      return sum + weight * quantity
    }, 0)

    const totalWeightKg = totalWeightGrams / 1000

    // Calculate shipping cost
    let calculatedAmount = this.options.base_rate

    if (totalWeightKg > 0) {
      calculatedAmount += Math.ceil(totalWeightKg) * this.options.rate_per_kg
    }

    // Apply multiplier for express shipping
    const optionId = optionData?.id as string
    if (optionId === "internal-express") {
      calculatedAmount = Math.round(calculatedAmount * 1.5)
    }

    this.logger.info(
      `InternalShipping: Calculated price for ${totalWeightKg}kg = ${calculatedAmount} cents`
    )

    return {
      calculated_amount: calculatedAmount,
      is_calculated_price_tax_inclusive: false,
    }
  }

  async createFulfillment(
    data: Record<string, unknown>,
    items: Partial<Omit<FulfillmentItemDTO, "fulfillment">>[],
    order: Partial<FulfillmentOrderDTO> | undefined,
    fulfillment: Partial<
      Omit<FulfillmentDTO, "provider_id" | "data" | "items">
    >
  ): Promise<CreateFulfillmentResult> {
    // Internal shipping - no external service integration
    // Generate an internal tracking number
    const trackingNumber = `INT-${Date.now()}-${Math.random().toString(36).substring(2, 8).toUpperCase()}`

    return {
      data: {
        ...(fulfillment.data as object || {}),
        tracking_number: trackingNumber,
      },
      labels: [],
    }
  }

  async cancelFulfillment(data: Record<string, unknown>): Promise<void> {
    // Internal shipping - nothing to cancel externally
    return
  }

  async createReturnFulfillment(
    fulfillment: Record<string, unknown>
  ): Promise<Record<string, unknown>> {
    // Return a simple return tracking
    return {
      tracking_number: `RET-${Date.now()}-${Math.random().toString(36).substring(2, 8).toUpperCase()}`,
    }
  }
}

export default InternalShippingProviderService
