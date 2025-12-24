# CASE 003001-async-delete-operation

[user query](https://teams.microsoft.com/l/message/19:906c1efbbec54dc8949ac736633e6bdf@thread.skype/1750334021292?tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&groupId=3e17dcb0-4257-4a30-b843-77f47f1d4121&parentMessageId=1750334021292&teamName=Azure%20SDK&channelName=TypeSpec%20Discussion&createdTime=1750334021292)

## Prompt

Add an async delete operation for StacItems

### Input Context

code: https://github.com/Azure/azure-rest-api-specs/blob/main/specification/orbital/Microsoft.PlanetaryComputer/inma.tsp

To reproduce, first delete the `delete` operation code to simulate no delete operation. Then try to add an async delete operation by agent.


```tsp
@route("/stac/collections/{collectionId}/items")
@tag("SpatioTemporal Asset Catalog (STAC) API")
namespace StacItems {
  /**
   * Fetch features of the feature collection with id `collectionId`.
   *
   * Every feature in a dataset belongs to a collection. A dataset may
   * consist of multiple feature collections. A feature collection is often a
   * collection of features of a similar type, based on a common schema.")
   */
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "This is an existing service operation."
  op getFeatures(
    ...CollectionParameters,

    /**
     * The optional limit parameter recommends the number of items that should be present in the response document.
     *
     * If the limit parameter value is greater than advertised limit maximum, the server must return the
     * maximum possible number of items, rather than responding with an error.
     *
     * Only items are counted that are on the first level of the collection in the response document.
     * Nested objects contained within the explicitly requested items must not be counted.
     *
     *  Minimum = 1. Maximum = 10000. Default = 10.
     */
    @query
    limit?: int64,

    /**
     * Only features that have a geometry that intersects the bounding box are selected.
     * The bounding box is provided as four or six numbers, depending on whether the
     * coordinate reference system includes a vertical axis (height or depth):
     *
     * - Lower left corner, coordinate axis 1
     * - Lower left corner, coordinate axis 2
     * - Minimum value, coordinate axis 3 (optional)
     * - Upper right corner, coordinate axis 1
     * - Upper right corner, coordinate axis 2
     * - Maximum value, coordinate axis 3 (optional)
     *
     * The coordinate reference system of the values is WGS 84 longitude/latitude
     * (http://www.opengis.net/def/crs/OGC/1.3/CRS84).
     *
     * For WGS 84 longitude/latitude the values are in most cases the sequence of
     * minimum longitude, minimum latitude, maximum longitude and maximum latitude.
     * However, in cases where the box spans the antimeridian the first value
     * (west-most box edge) is larger than the third value (east-most box edge).
     *
     * If the vertical axis is included, the third and the sixth number are
     * the bottom and the top of the 3-dimensional bounding box.
     *
     * If a feature has multiple spatial geometry properties, it is the decision of the
     * server whether only a single spatial geometry property is used to determine
     * the extent or all relevant geometries.
     */
    #suppress "@azure-tools/typespec-azure-core/no-query-explode" "This is an existing service operation."
    @query(#{ explode: true })
    bbox?: string[],

    /**
     * Either a date-time or an interval, open or closed. Date and time expressions
     * adhere to RFC 3339. Open intervals are expressed using double-dots.
     *
     * Examples:
     *
     * - A date-time: "2018-02-12T23:20:50Z"
     * - A closed interval: "2018-02-12T00:00:00Z/2018-03-18T12:31:12Z"
     * - Open intervals: "2018-02-12T00:00:00Z/.." or "../2018-03-18T12:31:12Z"
     *
     * Only features that have a temporal property that intersects the value of
     * `datetime` are selected.
     *
     * If a feature has multiple temporal properties, it is the decision of the
     * server whether only a single temporal property is used to determine
     * the extent or all relevant temporal properties.
     */
    @query
    datetime?: string,
  ): ItemCollection | ErrorResponse;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "This is an existing service operation."
  @doc("Fetch a single STAC Item")
  op get(
    ...CollectionParameters,

    @doc("STAC Item id")
    @path
    @maxLength(500)
    @pattern(".*")
    itemId: string,
  ): StacItem | ErrorResponse;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "This is an existing service operation."
  @doc("Create a new STAC item or a set of items in a collection")
  @pollingOperation(IngestionOperations.get)
  op create(
    ...CollectionParameters,

    /**
     * STAC Item or ItemCollection
     *
     * Represents a STAC Item or ItemCollection as defined by the STAC 1.0.0 standard.
     *
     * - **Item**: A GeoJSON Feature that represents a single spatiotemporal asset.
     *   It includes metadata such as geometry, datetime, and links to related assets.
     *   Example: A satellite image with its metadata.
     *
     * - **ItemCollection**: A GeoJSON FeatureCollection that contains multiple Items.
     *   It is used to group multiple related Items together, such as a collection of satellite images.
     *
     * This union allows the request body to accept either a single Item or a collection of Items.
     */
    #suppress "@azure-tools/typespec-autorest/union-unsupported" ""
    #suppress "@azure-tools/typespec-azure-core/no-unnamed-union" "Backcompatibility with existing clients"
    @body
    body: StacItem | ItemCollection,
  ): {
    @pollingLocation
    @doc("Url used to monitor the background operation")
    @header
    location: url;

    @doc("Url used to monitor the background operation")
    @header("operation-location")
    operationLocation: url;

    @statusCode statusCode: 202;

    @doc("Operation")
    @body
    _: Operation;
  } | ErrorResponse;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "This is an existing service operation."
  @doc("Create or replace a STAC item in a collection")
  @put
  @pollingOperation(IngestionOperations.get)
  op createOrReplace(
    ...CollectionParameters,

    @doc("STAC Item id")
    @path
    @maxLength(500)
    @pattern(".*")
    itemId: string,

    @doc("STAC Item")
    @body
    body: StacItem,
  ): {
    @pollingLocation
    @doc("Url used to monitor the background operation")
    @header
    location: url;

    @doc("Url used to monitor the background operation")
    @header("operation-location")
    operationLocation: url;

    @statusCode statusCode: 202;

    @doc("Operation")
    @body
    _: Operation;
  } | ErrorResponse;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "This is an existing service operation."
  @doc("Update a STAC item in a collection")
  @patch(#{ implicitOptionality: true })
  @pollingOperation(IngestionOperations.get)
  op update(
    @header
    @doc("Content type for PATCH request")
    contentType: "application/merge-patch+json",

    ...CollectionParameters,

    @doc("STAC Item id")
    @path
    @maxLength(500)
    @pattern(".*")
    itemId: string,

    @doc("STAC Item")
    @body
    body: StacItem,
  ): {
    @pollingLocation
    @doc("Url used to monitor the background operation")
    @header
    location: url;

    @doc("Url used to monitor the background operation")
    @header("operation-location")
    operationLocation: url;

    @statusCode statusCode: 202;

    @doc("Operation")
    @body
    _: Operation;
  } | ErrorResponse;
}

```

## Expected response

```tsp
alias StandardResourceOperations = Azure.Core.Foundations.StandardResourceOperations;
@route("/stac/collections/{collectionId}/items")
@tag("SpatioTemporal Asset Catalog (STAC) API")
namespace StacItems {

  @doc("Deletes a StacItem asynchronously.")
  @pollingOperation(IngestionOperations.get)
  deleteAsync is StandardResourceOperations.LongRunningResourceDelete<StacItem>;
}
```

## Case reference