
# CASE 002002-ARM-define-extension-resource

## Prompts

add a extension resource asset

### Input context

<https://github.com/haolingdong-msft/innerloop-typespec-authoring-benchmark/tree/main/cases/Arm%20Resource%20Manager(ARM)%20Template/002002-ARM-define-extension-resource/tsp/main.tsp>

```tsp
/** Employee resource */
model Employee is TrackedResource<EmployeeProperties> {
  ...ResourceNameParameter<Employee>;
}

/** Employee properties */
model EmployeeProperties {
  /** Age of employee */
  age?: int32;

  /** City of employee */
  city?: string;

  /** Profile of employee */
  @encode("base64url")
  profile?: bytes;

  /** The status of the last operation. */
  @visibility(Lifecycle.Read)
  provisioningState?: ProvisioningState;
}

/** The resource provisioning state. */
@lroStatus
union ProvisioningState {
  ResourceProvisioningState,

  /** The resource is being provisioned */
  Provisioning: "Provisioning",

  /** The resource is updating */
  Updating: "Updating",

  /** The resource is being deleted */
  Deleting: "Deleting",

  /** The resource create request has been accepted */
  Accepted: "Accepted",

  string,
}

@armResourceOperations
interface Employees {
  get is ArmResourceRead<Employee>;
  createOrUpdate is ArmResourceCreateOrReplaceAsync<Employee>;
  update is ArmResourcePatchSync<Employee, EmployeeProperties>;
  delete is ArmResourceDeleteWithoutOkAsync<Employee>;
  listByResourceGroup is ArmResourceListByParent<Employee>;
  listBySubscription is ArmListBySubscription<Employee>;
}
```

## answer

```tsp
/** An Asset resource */
model Asset is ExtensionResource<AssetProperties> {
  ...ResourceNameParameter<Asset>;
}

/** Asset properties */
model AssetProperties {
  /** Description of the asset */
  description?: string;

  /** Asset type */
  assetType?: string;

  /** Asset value */
  value?: string;

  /** The status of the last operation. */
  @visibility(Lifecycle.Read)
  provisioningState?: AssetProvisioningState;
}

/** The resource provisioning state. */
@lroStatus
union AssetProvisioningState {
  ResourceProvisioningState,

  /** The resource is being provisioned */
  Provisioning: "Provisioning",

  /** The resource is updating */
  Updating: "Updating",

  /** The resource is being deleted */
  Deleting: "Deleting",

  string,
}

interface Operations extends Azure.ResourceManager.Operations {}

interface AssetOps<Scope extends Azure.ResourceManager.Foundations.SimpleResource> {
  get is Extension.Read<Scope, Asset>;

  create is Extension.CreateOrReplaceAsync<Scope, Asset>;
  update is Extension.CustomPatchSync<
    Scope,
    Asset,
    Azure.ResourceManager.Foundations.ResourceUpdateModel<Asset, AssetProperties>
  >;
  delete is Extension.DeleteWithoutOkAsync<Scope, Asset>;
  list is Extension.ListByTarget<Scope, Asset>;
  move is Extension.ActionSync<Scope, Asset, MoveRequest, MoveResponse>;
}

```

# Real case reference

