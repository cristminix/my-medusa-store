import { defineWidgetConfig } from "@medusajs/admin-sdk"
import { useTranslation } from "react-i18next"
import { useEffect } from "react"

const LanguageDefaultWidget = () => {
    const { i18n } = useTranslation()

    useEffect(() => {
        // Force language to Indonesian (id) if it's not already set
        // This will run whenever the widget is mounted on a page
        if (i18n.language !== "id") {
            i18n.changeLanguage("id")
        }
    }, [i18n])

    return null
}

export const config = defineWidgetConfig({
    // We inject this into common list pages to ensure it triggers early
    zone: [
        "login.after",
        "order.list.before",
        "product.list.before",
        "customer.list.before",
        "campaign.list.before",
        "promotion.list.before"
    ],
})

export default LanguageDefaultWidget
