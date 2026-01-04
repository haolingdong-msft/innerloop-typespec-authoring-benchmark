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
@service(#{ title: "ContosoManagementClient" })
@versioned(Versions)
namespace Microsoft.Contoso;

/** Contoso API versions */
enum Versions {
	/** 2025-12-01-preview version */
	@armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
	`2025-12-01-preview`,
}

/** A Contoso User resource. */
model User is TrackedResource<UserProperties> {
	...ResourceNameParameter<User>;
}

/** Properties of the Contoso User resource. */
model UserProperties {
	/** Display name of the user. */
	displayName?: string;

	/** Email of the user. */
	email?: string;

	/** Assigned roles for the user. */
	roles?: string[];

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

/** Operations for Contoso User resources. */
@armResourceOperations
interface Users {
	/** Gets a User resource. */
	get is ArmResourceRead<User>;

	/** Creates or updates a User resource. */
	createOrUpdate is ArmResourceCreateOrReplaceAsync<User>;

	/** Patches a User resource. */
	update is ArmResourcePatchSync<User, UserProperties>;

	/** Deletes a User resource. */
	delete is ArmResourceDeleteWithoutOkAsync<User>;

	/** Lists User resources in a resource group. */
	listByResourceGroup is ArmResourceListByParent<User>;

	/** Lists User resources in a subscription. */
	listBySubscription is ArmListBySubscription<User>;
}


