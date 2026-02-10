import { ContainerRegistrationKeys } from "@medusajs/framework/utils";

export default async function ({ container }) {
    const query = container.resolve(ContainerRegistrationKeys.QUERY);
    const { data: brands } = await query.graph({
        entity: "brand",
        fields: ["id", "name"],
    });

    console.log("✅ Brand Module loaded sucessfully");
    console.log("Brands in database: ", brands);
}
