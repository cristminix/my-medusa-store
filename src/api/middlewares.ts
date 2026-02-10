import {
    defineMiddlewares,
    MedusaNextFunction,
    MedusaRequest,
    MedusaResponse,
    validateAndTransformBody,
    validateAndTransformQuery,
} from "@medusajs/framework/http";
import { Modules } from "@medusajs/framework/utils";
import {
    PostAdminCreateBrand,
    GetAdminBrandsParams,
} from "./admin/brands/validators";
import { z } from "@medusajs/framework/zod";
export default defineMiddlewares({
    routes: [
        {
            matcher: "/admin/products",
            method: "POST",
            additionalDataValidator: {
                brand_id: z.string().optional(),
            },
        },
        {
            matcher: "/admin/brands",
            method: "GET",
            middlewares: [
                validateAndTransformQuery(GetAdminBrandsParams, {
                    defaults: ["id", "name", "products.*"],
                    isList: true,
                }),
            ],
        },
        {
            matcher: "/admin/brands",
            method: "POST",
            middlewares: [validateAndTransformBody(PostAdminCreateBrand)],
        },
        {
            matcher: "/store*",
            middlewares: [
                async (
                    req: MedusaRequest,
                    res: MedusaResponse,
                    next: MedusaNextFunction,
                ) => {
                    // Skip for verify-email route
                    if (req.path.includes("/store/verify-email")) {
                        return next();
                    }

                    // Check if we have an authenticated customer
                    const authContext = (req as any).auth_context;

                    if (!authContext || authContext.actor_type !== "customer") {
                        return next();
                    }

                    const customerModuleService = req.scope.resolve(
                        Modules.CUSTOMER,
                    );

                    try {
                        const customer =
                            await customerModuleService.retrieveCustomer(
                                authContext.actor_id,
                            );

                        // If email_verified is explicitly false, block the request
                        if (customer.metadata?.email_verified === false) {
                            return res.status(403).json({
                                message:
                                    "Please verify your email address before accessing the store.",
                                type: "email_not_verified",
                            });
                        }
                    } catch (error) {
                        console.error(
                            "Error checking email verification:",
                            error,
                        );
                    }

                    next();
                },
            ],
        },
    ],
});
