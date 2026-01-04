import "@azure-tools/typespec-azure-resource-manager";

@service({
  title: "Contoso User Resource Service"
})
namespace Microsoft.Contoso {
  @resource("users")
  model UserResource extends Resource {
    @key
    name: string;
    properties: UserProperties;
  }

  model UserProperties {
    displayName: string;
    email: string;
    isActive: boolean;
  }
}
