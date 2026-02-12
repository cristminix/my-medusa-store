import { defineWidgetConfig } from "@medusajs/admin-sdk";
import { Container, Heading, Text } from "@medusajs/ui";
import { useEffect } from "react";

const OrderAdditionalInfoWidget = () => {
    const translateEnWidgetText = (srcText: string, targetText: string) => {
        function findElementsByContent(
            selector: string,
            content: string,
        ): Element[] {
            const elements = Array.from(
                document.querySelectorAll<HTMLElement>(selector),
            );
            return elements.filter(
                (el) => el.textContent?.includes(content) ?? false,
            );
        }

        // Example usage with your element's selector and content:
        const targetSelector =
            "span.txt-compact-xsmall-plus.bg-ui-bg-subtle.text-ui-fg-subtle.border-ui-border-base.box-border.flex.w-fit.select-none.items-center.overflow-hidden.rounded-md.border.pl-0.pr-1.leading-none.text-nowrap";
        const desiredContent = srcText; // Replace with the actual content you are looking for

        const foundElements: Element[] = findElementsByContent(
            targetSelector,
            desiredContent,
        );

        if (foundElements.length > 0) {
            console.log(
                `Found ${foundElements.length} elements with content "${desiredContent}":`,
            );
            foundElements.forEach((el, index) => {
                console.log(`Element ${index + 1}:`, el);
                el.textContent = targetText;
                // el.firstChild?.nextSibling?.textContent = "Menunggu Pengiriman";
                // You can perform further operations on 'el' here
                // For example, to change its style:
                // (el as HTMLElement).style.backgroundColor = 'yellow';
            });
        } else {
            console.log(`No elements found with content "${desiredContent}".`);
        }
    };
    useEffect(() => {
        // JavaScript kamu berjalan di sini setelah komponen di-mount
        console.log("Widget loaded!");

        // Contoh: manipulasi DOM
        const element = document.getElementById("my-element");
        if (element) {
            element.style.color = "blue";
        }

        // Cleanup function (opsional)
        translateEnWidgetText("Awaiting shipping", "Menunggu Pengiriman");
        translateEnWidgetText("Delivered", "Sudah Dikirim");
        translateEnWidgetText("Canceled", "Dibatalkan");
        return () => {
            console.log("Widget unmounted");
        };
    }, []); // Empty dependency array = hanya jalan sekali saat mount
    return (
        <Container className="divide-y p-0 hidden">
            <div className="flex items-center justify-between px-6 py-4">
                <Heading level="h2">Informasi Tambahan</Heading>
            </div>
            <div className="px-6 py-4">
                <Text>Masih dalam pengembangan</Text>
            </div>
        </Container>
    );
};

export const config = defineWidgetConfig({
    zone: "order.details.after",
});

export default OrderAdditionalInfoWidget;
