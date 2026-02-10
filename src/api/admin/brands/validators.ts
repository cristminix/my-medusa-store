import { z } from "@medusajs/framework/zod";

export const PostAdminCreateBrand = z.object({
    name: z.string(),
});

export type PostAdminCreateBrandType = z.infer<typeof PostAdminCreateBrand>;

export const GetAdminBrandsParams = z.object({
    id: z.string().optional(),
    name: z.string().optional(),
    fields: z.string().optional(),
    limit: z.coerce.number().optional(),
    offset: z.coerce.number().optional(),
    order: z.string().optional(),
});

export type GetAdminBrandsParamsType = z.infer<typeof GetAdminBrandsParams>;
