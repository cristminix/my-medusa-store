import { defineWidgetConfig } from "@medusajs/admin-sdk";
import { Container, Heading, Text } from "@medusajs/ui";
import { useQuery } from "@tanstack/react-query";
import { sdk } from "../lib/sdk";
import { DetailWidgetProps, AdminProduct } from "@medusajs/framework/types";

type Brand = {
    id: string;
    name: string;
};

const ProductBrandWidget = ({
    data: product,
}: DetailWidgetProps<AdminProduct>) => {
    const { data } = useQuery({
        queryFn: () =>
            sdk.admin.product.retrieve(product.id, {
                fields: "brand.*",
            }),
        queryKey: ["product-brand", product.id],
    });

    const brand = (data?.product as unknown as { brand?: Brand })?.brand;

    return (
        <Container className="divide-y p-0">
            <div className="flex items-center justify-between px-6 py-4">
                <Heading level="h2">Brand</Heading>
            </div>
            <div className="px-6 py-4">
                {brand ? (
                    <div className="flex flex-col gap-y-1">
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-base"
                        >
                            {brand.name}
                        </Text>
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-subtle"
                        >
                            ID: {brand.id}
                        </Text>
                    </div>
                ) : (
                    <Text size="small" className="text-ui-fg-subtle">
                        Tidak ada brand untuk produk ini
                    </Text>
                )}
            </div>
        </Container>
    );
};

export const config = defineWidgetConfig({
    zone: "product.details.after",
});

export default ProductBrandWidget;
