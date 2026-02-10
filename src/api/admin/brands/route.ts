import {
    AuthenticatedMedusaRequest,
    MedusaResponse,
} from "@medusajs/framework/http";

import { createBrandWorkflow } from "../../../workflows/create-brand";
import { PostAdminCreateBrandType } from "./validators";

export const POST = async (
    req: AuthenticatedMedusaRequest<PostAdminCreateBrandType>,
    res: MedusaResponse,
) => {
    const { result } = await createBrandWorkflow(req.scope).run({
        input: req.validatedBody,
    });
    res.json({ brand: result });
};

export const GET = async (
    req: AuthenticatedMedusaRequest<PostAdminCreateBrandType>,
    res: MedusaResponse,
) => {
    const query = req.scope.resolve("query");
    const { data: brands, metadata } = await query.graph({
        entity: "brand",
        ...req.queryConfig,
    });

    res.json({
        brands,
        count: metadata?.count,
        offset: metadata?.skip,
        limit: metadata?.take,
    });
};
