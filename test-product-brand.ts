import { ContainerRegistrationKeys } from "@medusajs/framework/utils";
export default async function ({ container }) {
    const query = container.resolve(ContainerRegistrationKeys.QUERY);
    const { data: products } = await query.graph({
        entity: "product",
        fields: ["id", "title", "brand.*"],
        filters: {
            title: "Kecap Malika",
        },
    });

    console.log("Products with brands:");
    console.log(JSON.stringify(products, null, 2));
}
