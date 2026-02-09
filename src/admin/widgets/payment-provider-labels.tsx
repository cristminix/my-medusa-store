import { defineWidgetConfig } from "@medusajs/admin-sdk";
import { useEffect } from "react";

/**
 * Widget to replace payment provider IDs with human-readable names
 * This runs on order pages and replaces the raw provider ID text
 */
const PaymentProviderLabelsWidget = () => {
  useEffect(() => {
    const paymentProviderMap: Record<string, string> = {
      "pp_wire-transfer_wire-transfer": "Bank Transfer",
      pp_cod_cod: "Cash On Delivery (COD)",
      pp_system_default: "Pembayaran Manual",
      // Add more payment providers here as needed
    };

    // Status text replacements (fallback if i18n doesn't apply)
    const statusTextMap: Record<string, string> = {
      Diotorisasi: "Disetujui",
      Authorized: "Disetujui",
      Pending: "Menunggu Pembayaran",
      Tertunda: "Menunggu Pembayaran",
      Diambil: "Diterima",
      // Add more status text replacements as needed
    };

    const replacePaymentProviderText = () => {
      // Find all text nodes that contain payment provider IDs
      const walker = document.createTreeWalker(
        document.body,
        NodeFilter.SHOW_TEXT,
        null,
      );

      const nodesToUpdate: { node: Text; newText: string }[] = [];

      let node: Text | null;
      while ((node = walker.nextNode() as Text | null)) {
        let text = node.textContent || "";
        let hasChanges = false;

        // Replace payment provider IDs
        for (const [providerId, displayName] of Object.entries(
          paymentProviderMap,
        )) {
          if (text.includes(providerId)) {
            text = text.replace(providerId, displayName);
            hasChanges = true;
          }
        }

        // Replace status texts
        for (const [oldText, newText] of Object.entries(statusTextMap)) {
          if (text.includes(oldText)) {
            text = text.replace(oldText, newText);
            hasChanges = true;
          }
        }

        if (hasChanges) {
          nodesToUpdate.push({ node, newText: text });
        }
      }

      // Apply updates
      for (const { node, newText } of nodesToUpdate) {
        node.textContent = newText;
      }
    };

    // Initial replacement
    replacePaymentProviderText();

    // Set up MutationObserver to handle dynamic content
    const observer = new MutationObserver(() => {
      replacePaymentProviderText();
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true,
    });

    return () => {
      observer.disconnect();
    };
  }, []);

  return null;
};

export const config = defineWidgetConfig({
  zone: ["order.details.before", "order.list.before"],
});

export default PaymentProviderLabelsWidget;
