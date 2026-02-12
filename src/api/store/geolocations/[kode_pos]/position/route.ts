// src/api/store/geolocations/[kode_pos]/metadata/route.ts
import {
    AuthenticatedMedusaRequest,
    MedusaResponse,
} from "@medusajs/framework/http";
import { updateOrderWorkflow } from "@medusajs/medusa/core-flows";
import { IOrderModuleService } from "@medusajs/types";
import { Modules } from "@medusajs/utils";

export const GET = async (
    req: AuthenticatedMedusaRequest,
    res: MedusaResponse,
) => {
    const { kode_pos: postalCode } = req.params;
    const { metadata } = req.body as any;
    const customerId = req.auth_context?.actor_id; // Ambil ID customer dari session

    res.json({ postalCode });
};
