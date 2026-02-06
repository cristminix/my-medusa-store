import {
  AbstractNotificationProviderService,
  MedusaError,
} from "@medusajs/framework/utils"
import {
  Logger,
  ProviderSendNotificationDTO,
  ProviderSendNotificationResultsDTO,
} from "@medusajs/framework/types"
import { Resend } from "resend"

type ResendOptions = {
  api_key: string
  from: string
}

type InjectedDependencies = {
  logger: Logger
}

class ResendNotificationProviderService extends AbstractNotificationProviderService {
  static identifier = "notification-resend"
  private resendClient: Resend
  private options: ResendOptions
  private logger: Logger

  constructor({ logger }: InjectedDependencies, options: ResendOptions) {
    super()
    this.resendClient = new Resend(options.api_key)
    this.options = options
    this.logger = logger
  }

  async send(
    notification: ProviderSendNotificationDTO
  ): Promise<ProviderSendNotificationResultsDTO> {
    const { to, template, data, content } = notification

    // Use content.html if provided, otherwise generate from template
    let html: string
    let subject: string

    if (content?.html) {
      html = content.html
      subject = content.subject || "Notification"
    } else {
      // Default templates based on template name
      const templateData = this.getTemplate(template, data || {})
      html = templateData.html
      subject = templateData.subject
    }

    const { data: result, error } = await this.resendClient.emails.send({
      from: this.options.from,
      to: [to],
      subject,
      html,
    })

    if (error || !result) {
      this.logger.error("Failed to send email", error)
      throw new MedusaError(
        MedusaError.Types.UNEXPECTED_STATE,
        `Failed to send email: ${error?.message || "Unknown error"}`
      )
    }

    return { id: result.id }
  }

  private getTemplate(
    template: string,
    data: Record<string, unknown>
  ): { html: string; subject: string } {
    switch (template) {
      case "password-reset":
        return {
          subject: "Reset Your Password",
          html: this.getPasswordResetTemplate(data),
        }
      case "email-verification":
        return {
          subject: "Verifikasi Email Anda",
          html: this.getEmailVerificationTemplate(data),
        }
      default:
        return {
          subject: "Notification",
          html: `<p>${JSON.stringify(data)}</p>`,
        }
    }
  }

  private getEmailVerificationTemplate(data: Record<string, unknown>): string {
    const verificationUrl = data.verification_url as string
    return `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verifikasi Email Anda</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; padding: 40px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <h1 style="color: #1a1a1a; font-size: 24px; margin-bottom: 24px; text-align: center;">
      Verifikasi Email Anda
    </h1>
    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.6; margin-bottom: 24px;">
      Terima kasih telah mendaftar. Silakan klik tombol di bawah ini untuk memverifikasi alamat email Anda:
    </p>
    <div style="text-align: center; margin-bottom: 24px;">
      <a href="${verificationUrl}" style="display: inline-block; background-color: #000000; color: #ffffff; text-decoration: none; padding: 14px 28px; border-radius: 6px; font-size: 16px; font-weight: 500;">
        Verifikasi Email
      </a>
    </div>
    <p style="color: #6a6a6a; font-size: 14px; line-height: 1.6;">
      Jika Anda tidak membuat akun ini, Anda dapat mengabaikan email ini dengan aman.
    </p>
    <hr style="border: none; border-top: 1px solid #e0e0e0; margin: 32px 0;">
    <p style="color: #9a9a9a; font-size: 12px; text-align: center;">
      Email ini dikirim secara otomatis. Mohon jangan membalas.
    </p>
  </div>
</body>
</html>
`
  }

  private getPasswordResetTemplate(data: Record<string, unknown>): string {
    const resetUrl = data.reset_url as string
    return `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Your Password</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; padding: 40px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <h1 style="color: #1a1a1a; font-size: 24px; margin-bottom: 24px; text-align: center;">
      Permintaan Reset Kata Sandi
    </h1>
    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.6; margin-bottom: 24px;">
      Anda telah meminta untuk mereset kata sandi Anda. Klik tombol di bawah ini untuk melanjutkan:
    </p>
    <div style="text-align: center; margin-bottom: 24px;">
      <a href="${resetUrl}" style="display: inline-block; background-color: #000000; color: #ffffff; text-decoration: none; padding: 14px 28px; border-radius: 6px; font-size: 16px; font-weight: 500;">
        Reset Kata Sandi
      </a>
    </div>
    <p style="color: #6a6a6a; font-size: 14px; line-height: 1.6;">
      Jika Anda tidak meminta reset kata sandi, Anda dapat mengabaikan email ini dengan aman. Tautan ini akan kedaluwarsa dalam 1 jam.
    </p>
    <hr style="border: none; border-top: 1px solid #e0e0e0; margin: 32px 0;">
    <p style="color: #9a9a9a; font-size: 12px; text-align: center;">
      Email ini dikirim secara otomatis. Mohon jangan membalas.
    </p>
  </div>
</body>
</html>
`
  }
}

export default ResendNotificationProviderService
