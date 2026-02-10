import { z } from "@medusajs/framework/zod";
export const PostAdminCreateBrand = z.object({
    name: z.string(),
});

export type PostAdminCreateBrandType = z.infer<typeof PostAdminCreateBrand>;
