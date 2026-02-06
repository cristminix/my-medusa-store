import { SubscriberArgs, type SubscriberConfig } from "@medusajs/medusa"
import { Modules } from "@medusajs/framework/utils"
import * as crypto from "crypto"

type CustomerCreatedEventData = {
  id: string
}

export default async function customerCreatedHandler({
  event: {
    data: { id },
  },
  container,
}: SubscriberArgs<CustomerCreatedEventData>) {
  const customerModuleService = container.resolve(Modules.CUSTOMER)
  const notificationModuleService = container.resolve(Modules.NOTIFICATION)
  const config = container.resolve("configModule")

  const customer = await customerModuleService.retrieveCustomer(id)

  // Skip if already verified
  if (customer.metadata?.email_verified === true) {
    return
  }

  const token = crypto.randomBytes(32).toString("hex")

  await customerModuleService.updateCustomers(id, {
    metadata: {
      ...customer.metadata,
      email_verified: false,
      email_verification_token: token,
    },
  })

  const storefrontUrl = config.admin?.storefrontUrl || "http://localhost:8000"
  const verificationUrl = `${storefrontUrl}/verify-email?token=${token}&email=${customer.email}`

  await notificationModuleService.createNotifications({
    to: customer.email,
    channel: "email",
    template: "email-verification",
    data: {
      verification_url: verificationUrl,
    },
  })
}

export const config: SubscriberConfig = {
  event: "customer.created",
}
