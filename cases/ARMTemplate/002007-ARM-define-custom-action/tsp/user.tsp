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

/** Request body for the notify action. */
model NotifyRequest {
	/** The notification message to send. */
	message: string;

	/** The notification priority. */
	priority?: "low" | "medium" | "high";
}

/** Response for the notify action. */
model NotifyResponse {
	/** Indicates whether the notification was sent successfully. */
	success: boolean;

	/** Additional message about the notification status. */
	@visibility(Lifecycle.Read)
	statusMessage?: string;
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

	/** Sends a notification to the User resource. */
	notify is ArmResourceActionSync<User, NotifyRequest, NotifyResponse>;
}

/** A Contoso Address resource. */
@parentResource(User)
model Address is ProxyResource<AddressProperties> {
	...ResourceNameParameter<Address>;
}

/** Properties of the Contoso Address resource. */
model AddressProperties {
	/** Street address line 1. */
	street1?: string;

	/** Street address line 2. */
	street2?: string;

	/** City name. */
	city?: string;

	/** State or province name. */
	state?: string;

	/** Postal or ZIP code. */
	postalCode?: string;

	/** Country name. */
	country?: string;

	/** The status of the last operation. */
	@visibility(Lifecycle.Read)
	provisioningState?: ProvisioningState;
}

/** Operations for Contoso Address resources. */
@armResourceOperations
interface Addresses {
	/** Gets an Address resource. */
	get is ArmResourceRead<Address>;

	/** Creates or updates an Address resource. */
	createOrUpdate is ArmResourceCreateOrReplaceAsync<Address>;

	/** Patches an Address resource. */
	update is ArmResourcePatchSync<Address, AddressProperties>;

	/** Deletes an Address resource. */
	delete is ArmResourceDeleteWithoutOkAsync<Address>;

	/** Lists Address resources for a User. */
	listByParent is ArmResourceListByParent<Address>;
}


