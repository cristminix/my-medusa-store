import { loadEnv, defineConfig } from "@medusajs/framework/utils";

loadEnv(process.env.NODE_ENV || "development", process.cwd());

module.exports = defineConfig({
    admin: {
        backendUrl: process.env.MEDUSA_BACKEND_URL || "http://localhost:9000",
        storefrontUrl:
            process.env.MEDUSA_STOREFRONT_URL || "http://localhost:8000",
    },
    projectConfig: {
        redisUrl: process.env.REDIS_URL,
        databaseUrl: process.env.DATABASE_URL,
        databaseDriverOptions: {
            connection: {
                ssl: false, // Matikan SSL secara eksplisit
            },
        },
        cookieOptions: {
            sameSite: "lax",
            secure: false,
        },
        http: {
            storeCors: process.env.STORE_CORS!,
            adminCors: process.env.ADMIN_CORS!,
            authCors: process.env.AUTH_CORS!,
            jwtSecret: process.env.JWT_SECRET || "supersecret",
            cookieSecret: process.env.COOKIE_SECRET || "supersecret",
        },
    },
    modules: [
        {
            resolve: "./src/modules/brand",
        },
        {
            resolve: "@medusajs/medusa/file",
            options: {
                providers: [
                    {
                        resolve: "@medusajs/medusa/file-local",
                        id: "local",
                        options: {
                            backend_url:
                                process.env.MEDUSA_BACKEND_URL + "/static/",
                        },
                    },
                ],
            },
        },
        {
            resolve: "@medusajs/medusa/notification",
            options: {
                providers: [
                    {
                        resolve: "./src/modules/resend",
                        id: "resend",
                        options: {
                            channels: ["email"],
                            api_key: process.env.RESEND_API_KEY,
                            from: process.env.RESEND_FROM_EMAIL,
                        },
                    },
                ],
            },
        },
        {
            resolve: "@medusajs/medusa/fulfillment",
            options: {
                providers: [
                    {
                        resolve: "@medusajs/medusa/fulfillment-manual",
                        id: "manual",
                    },
                    {
                        resolve: "./src/modules/internal-shipping",
                        id: "internal-shipping",
                        options: {
                            base_rate: 10000, // Base rate: 10000 cents = 100.00
                            rate_per_kg: 5000, // Per kg rate: 5000 cents = 50.00
                        },
                    },
                ],
            },
        },
        {
            resolve: "@medusajs/medusa/payment",
            options: {
                providers: [
                    {
                        resolve: "./src/modules/cod-payment",
                        id: "cod",
                        options: {
                            // Optional: Maximum order amount allowed for COD (e.g., 5000000 = 5,000,000)
                            // max_amount: 5000000,
                            // Optional: COD fee to be added (e.g., 5000 = 5,000)
                            // cod_fee: 5000,
                        },
                    },
                    {
                        resolve: "./src/modules/wire-transfer",
                        id: "wire-transfer",
                        options: {
                            bank_name:
                                process.env.WIRE_TRANSFER_BANK_NAME ||
                                "Bank Central Asia",
                            account_number:
                                process.env.WIRE_TRANSFER_ACCOUNT_NUMBER ||
                                "507 505 4278",
                            account_holder:
                                process.env.WIRE_TRANSFER_ACCOUNT_HOLDER ||
                                "PT PAWON GEMILANG RASA",
                            // Optional: SWIFT code for international transfers
                            // swift_code: "CENAIDJA",
                            // Optional: Additional instructions
                            instructions:
                                "Silahkan masukkan nomor pesanan Anda dalam deskripsi transfer",
                        },
                    },
                ],
            },
        },
    ],
});
