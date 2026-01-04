
# CASE 004001-decorate-mgmt-resource-name-parameter

## Prompts

add minLength decorator to set the minLength 1 for resource name parameter of Employee resource

### Input context

<https://github.com/haolingdong-msft/innerloop-typespec-authoring-benchmark/blob/main/cases/Decorators/004001-decorate-mgmt-resource-name-parameter/tsp/main.tsp>

```tsp
import "@typespec/http";
import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using Http;
using Rest;
using Versioning;
using Azure.Core;
using Azure.ResourceManager;

/** Contoso Resource Provider management API. */
@armProviderNamespace
@service(#{ title: "ContosoProviderHubClient" })
@versioned(Versions)
namespace Microsoft.ContosoProviderHub;

/** Contoso API versions */
enum Versions {
  /** 2021-10-01-preview version */
  // @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
  `2021-10-01-preview`,

  /** 2021-10-01-preview version */
  // @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
  `2024-10-01-preview`,
}

/** A ContosoProviderHub resource */
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

/** The provisioning state of a resource. */
@lroStatus
union ProvisioningState {
  string,

  /** The resource create request has been accepted */
  Accepted: "Accepted",

  /** The resource is being provisioned */
  Provisioning: "Provisioning",

  /** The resource is updating */
  Updating: "Updating",

  /** Resource has been created. */
  Succeeded: "Succeeded",

  /** Resource creation failed. */
  Failed: "Failed",

  /** Resource creation was canceled. */
  Canceled: "Canceled",

  /** The resource is being deleted */
  Deleting: "Deleting",
}

/** Employee move request */
model MoveRequest {
  /** The moving from location */
  from: string;

  /** The moving to location */
  to: string;
}

/** Employee move response */
model MoveResponse {
  /** The status of the move */
  movingStatus: string;
}

interface Operations extends Azure.ResourceManager.Operations {}

@armResourceOperations
interface Employees {
  get is ArmResourceRead<Employee>;
  createOrUpdate is ArmResourceCreateOrReplaceAsync<Employee>;
  update is ArmCustomPatchSync<
    Employee,
    Azure.ResourceManager.Foundations.ResourceUpdateModel<
      Employee,
      EmployeeProperties
    >
  >;
  delete is ArmResourceDeleteWithoutOkAsync<Employee>;
  listByResourceGroup is ArmResourceListByParent<Employee>;
  listBySubscription is ArmListBySubscription<Employee>;

  /** A sample resource action that move employee to different location */
  move is ArmResourceActionSync<Employee, MoveRequest, MoveResponse>;

  /** A sample HEAD operation to check resource existence */
  checkExistence is ArmResourceCheckExistence<Employee>;
}
```

## answer

You cannot decorator directly on the Employee resource name parameter because the resource name parameter will change from 'name' to 'employeeName' after compile. So @@maxLength(Employee.name, 256); will not affect on the resource name.

solution 1: change the resource name to 'name'

```tsp
/** A ContosoProviderHub resource */
model Employee is TrackedResource<EmployeeProperties> {
  ...ResourceNameParameter<Employee, KeyName = "name">;
}

@@minLength(Employee.name, 1)

```

solution 2: define the resource name directly, not use `...ResourceNameParameter<Employee>`

``` tsp
model Employee is TrackedResource<EmployeeProperties> {
   /**
     * Namespace name
     */
    @key("employeeName")
    @path
    @segment("employees")
    @pattern("^[a-zA-Z][a-zA-Z0-9-]*$")
    @minLength(1)
    name: string,
}

```

![alt text](image-1.png)

## Real case reference

[Augmented decorators on resource in the multi-path scenario](https://teams.microsoft.com/l/message/19:906c1efbbec54dc8949ac736633e6bdf@thread.skype/1746001970273?tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&groupId=3e17dcb0-4257-4a30-b843-77f47f1d4121&parentMessageId=1746001970273&teamName=Azure%20SDK&channelName=TypeSpec%20Discussion&createdTime=1746001970273)
