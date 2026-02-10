import Medusa from "@medusajs/js-sdk";

// In admin dashboard code, environment variables are not available at runtime.
// The backend URL is already configured in medusa-config.ts and injected by Medusa.
// For custom SDK instances, use the same base URL that the browser is accessing.
export const sdk = new Medusa({
    baseUrl:
        typeof window !== "undefined"
            ? window.location.origin // Use the current origin (where admin is served from)
            : (import.meta.env.VITE_MEDUSA_BACKEND_URL ??
              "http://192.168.0.107:9000"), // Fallback for SSR/build time
    debug: import.meta.env.DEV, // Vite's way to check development mode
    auth: {
        type: "session",
    },
});
