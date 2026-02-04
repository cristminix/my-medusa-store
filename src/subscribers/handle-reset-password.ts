import { SubscriberArgs, type SubscriberConfig } from "@medusajs/medusa"
import { Modules } from "@medusajs/framework/utils"

type PasswordResetEventData = {
  entity_id: string
  token: string
  actor_type: string
}

export default async function resetPasswordTokenHandler({
  event: {
    data: { entity_id: email, token, actor_type },
  },
  container,
}: SubscriberArgs<PasswordResetEventData>) {
  const notificationModuleService = container.resolve(Modules.NOTIFICATION)
  const config = container.resolve("configModule")

  let urlPrefix = ""

  if (actor_type === "customer") {
    urlPrefix = config.admin?.storefrontUrl || "http://localhost:8000"
  } else {
    const backendUrl =
      config.admin?.backendUrl !== "/"
        ? config.admin?.backendUrl
        : "http://localhost:9000"
    const adminPath = config.admin?.path || "/app"
    urlPrefix = `${backendUrl}${adminPath}`
  }

  const resetUrl = `${urlPrefix}/reset-password?token=${token}&email=${email}`

  await notificationModuleService.createNotifications({
    to: email,
    channel: "email",
    template: "password-reset",
    data: {
      reset_url: resetUrl,
    },
  })
}

export const config: SubscriberConfig = {
  event: "auth.password_reset",
}
