// src/api/store/orders/[id]/metadata/route.ts
import { AuthenticatedMedusaRequest, MedusaResponse } from "@medusajs/framework/http";
import { updateOrderWorkflow } from "@medusajs/medusa/core-flows";
import { IOrderModuleService } from "@medusajs/types";
import { Modules } from "@medusajs/utils";

export const POST = async (req: AuthenticatedMedusaRequest, res: MedusaResponse) => {
    const { id } = req.params;
    const { metadata } = req.body as any;
    const customerId = req.auth_context?.actor_id; // Ambil ID customer dari session

    const orderModuleService: IOrderModuleService = req.scope.resolve(
        Modules.ORDER,
    );

    // 1. Ambil data order untuk cek kepemilikan
    const order = await orderModuleService.retrieveOrder(id);

    // 2. Validasi: Apakah order ini milik customer yang sedang login?
    if (order.customer_id !== customerId) {
        return res.status(401).json({ message: "Bukan pesanan Anda" });
    }

    // 3. Jika valid, jalankan update
    const { result } = await updateOrderWorkflow(req.scope).run({
        input: {
            id,
            user_id: customerId || "", // Ensure string, though validation above protects it
            metadata,
        },
    });

    res.json({ order: result });
};
