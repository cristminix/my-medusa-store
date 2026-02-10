import { defineRouteConfig } from "@medusajs/admin-sdk";
import { ChatBubbleLeftRight } from "@medusajs/icons";
import { Container, Heading, Table } from "@medusajs/ui";
import { useQuery } from "@tanstack/react-query";
import { sdk } from "../../lib/sdk";
type BrandResponse = {
    brands: {
        id: string;
        name: string;
        products: { id: string }[];
    }[];
    count: number;
    offset: number;
    limit: number;
};

const BrandPage = () => {
    const { data, isLoading } = useQuery({
        queryKey: ["brands"],
        queryFn: () =>
            sdk.client.fetch<BrandResponse>("/admin/brands", {
                query: {
                    fields: "id,name,products.id",
                },
            }),
    });

    return (
        <Container>
            <div className="flex items-center justify-between px-6 py-4">
                <Heading level="h2">Brands</Heading>
            </div>
            <Table>
                <Table.Header>
                    <Table.Row>
                        <Table.HeaderCell>Name</Table.HeaderCell>
                        <Table.HeaderCell>Jumlah Produk</Table.HeaderCell>
                        <Table.HeaderCell>ID</Table.HeaderCell>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {isLoading ? (
                        <Table.Row>
                            <Table.Cell
                                colSpan={3}
                                className="text-center py-4"
                            >
                                Memuat ...
                            </Table.Cell>
                        </Table.Row>
                    ) : data?.brands && data.brands.length > 0 ? (
                        data.brands.map((brand) => (
                            <Table.Row key={brand.id}>
                                <Table.Cell>{brand.name}</Table.Cell>
                                <Table.Cell>
                                    {brand.products?.length || 0}
                                </Table.Cell>
                                <Table.Cell className="text-ui-fg-subtle">
                                    {brand.id}
                                </Table.Cell>
                            </Table.Row>
                        ))
                    ) : (
                        <Table.Row>
                            <Table.Cell
                                colSpan={3}
                                className="text-center py-4"
                            >
                                Belum ada merek
                            </Table.Cell>
                        </Table.Row>
                    )}
                </Table.Body>
            </Table>
        </Container>
    );
};

export const config = defineRouteConfig({
    label: "Brands",
    icon: ChatBubbleLeftRight,
});

export default BrandPage;
