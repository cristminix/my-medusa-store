import { ModuleProvider, Modules } from "@medusajs/framework/utils"
import WireTransferPaymentProviderService from "./service"

export default ModuleProvider(Modules.PAYMENT, {
  services: [WireTransferPaymentProviderService],
})
