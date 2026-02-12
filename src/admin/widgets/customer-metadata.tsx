import { defineWidgetConfig } from "@medusajs/admin-sdk";
import { Container, Heading, Text, Badge, Button } from "@medusajs/ui";
import { useQuery } from "@tanstack/react-query";
import { sdk } from "../lib/sdk";
import { DetailWidgetProps, AdminCustomer } from "@medusajs/framework/types";

type CustomerMetadata = {
    document_ktp?: string;
    document_npwp?: string;
    email_verified?: boolean;
    document_gambar_toko?: string;
    document_ktp_uploaded_at?: string;
    email_verification_token?: string;
    document_npwp_uploaded_at?: string;
    document_gambar_toko_uploaded_at?: string;
};

const CustomerMetadataWidget = ({
    data: customer,
}: DetailWidgetProps<AdminCustomer>) => {
    const { data, isLoading, isError } = useQuery({
        queryFn: () =>
            sdk.admin.customer.retrieve(customer.id, {
                fields: "metadata",
            }),
        queryKey: ["customer-metadata", customer.id],
    });

    if (isLoading) {
        return (
            <Container className="p-0">
                <div className="flex items-center justify-between px-6 py-4">
                    <Heading level="h2">Data Tambahan</Heading>
                </div>
                <div className="px-6 py-4">
                    <Text>Loading...</Text>
                </div>
            </Container>
        );
    }

    if (isError) {
        return (
            <Container className="p-0">
                <div className="flex items-center justify-between px-6 py-4">
                    <Heading level="h2">Data Tambahan</Heading>
                </div>
                <div className="px-6 py-4">
                    <Text>Kesalahan saat memuat data</Text>
                </div>
            </Container>
        );
    }

    const metadata = (
        data?.customer as unknown as { metadata?: CustomerMetadata }
    )?.metadata;

    if (!metadata) {
        return (
            <Container className="p-0">
                <div className="flex items-center justify-between px-6 py-4">
                    <Heading level="h2">Data Tambahan</Heading>
                </div>
                <div className="px-6 py-4">
                    <Text>Belum ada data</Text>
                </div>
            </Container>
        );
    }

    const formatDate = (dateString?: string) => {
        if (!dateString) return "Not uploaded";
        try {
            return new Date(dateString).toLocaleString("en-US", {
                year: "numeric",
                month: "short",
                day: "numeric",
                hour: "2-digit",
                minute: "2-digit",
            });
        } catch {
            return dateString;
        }
    };

    return (
        <Container className="divide-y p-0">
            <div className="flex items-center justify-between px-6 py-4">
                <Heading level="h2">Customer Metadata</Heading>
            </div>

            <div className="px-6 py-4 space-y-4">
                {/* Email Verification Status */}
                <div className="space-y-2">
                    <Text
                        size="small"
                        weight="plus"
                        className="text-ui-fg-base"
                    >
                        Verifikasi Email
                    </Text>
                    <Badge color={metadata.email_verified ? "green" : "orange"}>
                        {metadata.email_verified ? "Verified" : "Not Verified"}
                    </Badge>
                </div>

                {/* Document KTP */}
                {metadata.document_ktp && (
                    <div className="space-y-2">
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-base"
                        >
                            Dokumen KTP
                        </Text>
                        <div className="flex flex-col gap-1">
                            <a
                                href={metadata.document_ktp}
                                target="_blank"
                                rel="noopener noreferrer"
                            >
                                <Button variant="secondary" size="small">
                                    Lihat KTP
                                </Button>
                            </a>
                            {metadata.document_ktp_uploaded_at && (
                                <Text
                                    size="xsmall"
                                    className="text-ui-fg-subtle"
                                >
                                    Di unggah:{" "}
                                    {formatDate(
                                        metadata.document_ktp_uploaded_at,
                                    )}
                                </Text>
                            )}
                        </div>
                    </div>
                )}

                {/* Document NPWP */}
                {metadata.document_npwp && (
                    <div className="space-y-2">
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-base"
                        >
                            Dokumen NPWP
                        </Text>
                        <div className="flex flex-col gap-1">
                            <a
                                href={metadata.document_npwp}
                                target="_blank"
                                rel="noopener noreferrer"
                            >
                                <Button variant="secondary" size="small">
                                    Lihat NPWP
                                </Button>
                            </a>
                            {metadata.document_npwp_uploaded_at && (
                                <Text
                                    size="xsmall"
                                    className="text-ui-fg-subtle"
                                >
                                    Diunggah:{" "}
                                    {formatDate(
                                        metadata.document_npwp_uploaded_at,
                                    )}
                                </Text>
                            )}
                        </div>
                    </div>
                )}

                {/* Document Gambar Toko */}
                {metadata.document_gambar_toko && (
                    <div className="space-y-2">
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-base"
                        >
                            Gambar Toko/Outlet
                        </Text>
                        <div className="flex flex-col gap-1">
                            <a
                                href={metadata.document_gambar_toko}
                                target="_blank"
                                rel="noopener noreferrer"
                            >
                                <Button variant="secondary" size="small">
                                    Lihat Gambar Toko/Outlet
                                </Button>
                            </a>
                            {metadata.document_gambar_toko_uploaded_at && (
                                <Text
                                    size="xsmall"
                                    className="text-ui-fg-subtle"
                                >
                                    Diunggah:{" "}
                                    {formatDate(
                                        metadata.document_gambar_toko_uploaded_at,
                                    )}
                                </Text>
                            )}
                        </div>
                    </div>
                )}

                {/* Additional metadata fields */}
                {metadata.email_verification_token && (
                    <div className="space-y-2">
                        <Text
                            size="small"
                            weight="plus"
                            className="text-ui-fg-base"
                        >
                            Verification Token
                        </Text>
                        <Text
                            size="small"
                            className="text-ui-fg-subtle break-all"
                        >
                            {metadata.email_verification_token}
                        </Text>
                    </div>
                )}
            </div>
        </Container>
    );
};

export const config = defineWidgetConfig({
    zone: "customer.details.after",
});

export default CustomerMetadataWidget;
