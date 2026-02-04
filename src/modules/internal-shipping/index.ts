import { ModuleProvider, Modules } from "@medusajs/framework/utils"
import InternalShippingProviderService from "./service"

export default ModuleProvider(Modules.FULFILLMENT, {
  services: [InternalShippingProviderService],
})
