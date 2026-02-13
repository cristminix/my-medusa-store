import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http";
import { Modules } from "@medusajs/framework/utils";
import * as crypto from "crypto";

export async function POST(req: MedusaRequest, res: MedusaResponse) {
    const authContext = (req as any).auth_context;

    if (!authContext || !authContext.actor_id) {
        return res.status(401).json({ message: "Unauthorized" });
    }

    const customerModuleService = req.scope.resolve(Modules.CUSTOMER);
    const notificationModuleService = req.scope.resolve(Modules.NOTIFICATION);
    const config = req.scope.resolve("configModule");

    const customer = await customerModuleService.retrieveCustomer(
        authContext.actor_id,
    );

    if (!customer) {
        return res.status(404).json({ message: "Customer not found" });
    }

    if (customer.metadata?.email_verified === true) {
        return res.status(400).json({ message: "Email is already verified" });
    }

    const token = crypto.randomBytes(32).toString("hex");

    await customerModuleService.updateCustomers(customer.id, {
        metadata: {
            ...customer.metadata,
            email_verification_token: token,
            email_verified: false,
        },
    });

    const storefrontUrl = "http://148.230.96.242:8001"; // config.admin?.storefrontUrl || "http://localhost:8000"
    const verificationUrl = `${storefrontUrl}/verify-email?token=${token}&email=${customer.email}`;

    await notificationModuleService.createNotifications({
        to: customer.email,
        channel: "email",
        template: "email-verification",
        data: {
            verification_url: verificationUrl,
        },
    });

    return res.json({ message: "Verification email resent successfully" });
}

export async function GET(req: MedusaRequest, res: MedusaResponse) {
    const { token, email } = req.query as { token: string; email: string };

    if (!token || !email) {
        return res
            .status(400)
            .json({ message: "Token and email are required" });
    }

    const customerModuleService = req.scope.resolve(Modules.CUSTOMER);
    const config = req.scope.resolve("configModule");
    const storefrontUrl =
        config.admin?.storefrontUrl || "http://localhost:8000";

    const [customer] = await customerModuleService.listCustomers({
        email,
    });

    if (!customer) {
        return res.status(404).json({ message: "Customer not found" });
    }

    if (customer.metadata?.email_verification_token !== token) {
        return res.status(400).json({ message: "Invalid verification token" });
    }

    await customerModuleService.updateCustomers(customer.id, {
        metadata: {
            ...customer.metadata,
            email_verified: true,
            email_verification_token: null,
        },
    });

    return res.json({ message: "Email verified successfully" });
}
