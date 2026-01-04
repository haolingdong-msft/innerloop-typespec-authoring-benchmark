https://azure.github.io/typespec-azure/playground/?options=%7B%22linterRuleSet%22%3A%7B%22extends%22%3A%5B%22%40azure-tools%2Ftypespec-azure-rulesets%2Fresource-manager%22%5D%7D%7D&c=aW1wb3J0ICJAdHlwZXNwZWMvaHR0cCI7CtIZcmVzdNUZdmVyc2lvbmluZ8wfYXp1cmUtdG9vbHMvyCstxhVjb3Jl3yvIK3Jlc291cmNlLW1hbmFnZXIiOwoKdXNpbmcgSHR0cDvHDFJlc3TIDFbpAI7IEkHESi5Db3JlzhJSx1xNxls7CgovKiogQ29udG9zb8RUxR4gUHJvdmlkZXIg5gCDbWVudCBBUEkuICovCkBhcm3IIE5hbWVzcGFjZQpAc2VydmljZSgjeyB0aXRsZTogIsdXyC1IdWJDbGllbnQiIH0pCkDnAUNlZCjnAL9zKQpuyFAgTWljcm9zb2Z0LtJG7wC2QVBJIMdNc%2BQAoWVudW3oARNzIHsKICDELjIwMjEtMTAtMDEtcHJldmlld8g1xDQgIOQA10NvbW1vblTkAY%2FHQCj1ATcuyykuyGoudjUpCiAgYNJpYCwKfeYAs0HoALXrAM4g6AHw5ACIbW9kZWwgRW1wbG95ZWUgaXMgVHJhY2tlZOgAgjzIHFByb3BlcnRpZXM%2B5QDkLi7pAKbkAZZQYXJhbWV0ZXLJMT476ACGyV9wyUTSfMpg6QFDQWdlIG9mIGXIP%2BUBOGFnZT86IGludDMyOwrHKUNpdHnSKmNpdHk%2FOiBzdHLlAqnHLFByb2ZpbNNZQGVuY29kZSgiYmFzZTY0dXJsIuQBYHDGMD86IGJ5dGVzyUhUaGUgc3RhdHVzxEt0aGUgbGFzdCDkAMVhdGlvbuUCvCAgQHZpc2liaWxpdHkoTGlmZWN5Y2zkAeBhZMddxCDlA0tTdGF0xGflAavMFOkBSMRzzDLlAIDlAMph6QHVxXdAbHJvxDt1cwp1buQCctFU5QFk5gEaLOwA0shHIGNyZcQncmVxdWVzdCBoYXMgYmVlbiBhY2NlcHRlZMRnICBBxw46ICLICyLWUGnEQOQAtOkAwchE7ACcOiAizA%2FaTHVwZGF0xE%2FFQ1XHDjogIsgLyjvpBGXpAMTmANxk5wGiU3VjY2VlZOUAxckM0z%2FFNuQBTWZhaWzJPkbFDTogIsYJ3Dh3YXMgY2FuY2XKPkPHD%2BQEvccL%2FwFAIGRlbGXpAYBExA3mAPnICyLpA%2F3pA3dtb3bqAcrpA3lNb3ZlUscV6ANyxHNtb3bEaGZyb20gbG9j5gC8xW7EE%2FEDUMszdG%2FPMXRvyi%2F3AJVzcG9uc%2BsEi%2BYAlscW7ACX7gNsxT7FZMZ85gLuzW5pbnRlcmbkBdxP6AOUcyBleHRlbmRz9gaeLsspe30K5wCSVGVyYWZvcm3JHcZs5AGSQdEW6gT%2B5QC95ACICmFsaWFzIExyb0hlYWRlcnMgPesHLy5Gb3Vu5AKz5AXSUmV0cnlBZnRlcsYrICbkA2TlBihiaW5lZMpEPEZpbmFsUmVzdWx0ID3pAVY%2BOwrlBzDoANnqANHrAQ9UZXLmANLlAKNAZG9jKCJFeOQIKHPlAVzKIGNvbmZpZ3XGQ%2BgBe%2BQIOmlmaWVk6QKdKHMpLuUFLEB0YWfITMlGxhp1c2XlALPlBH5WaWEoIuYIfWFzeW5jLekFNsYtcmV0dXLlBu9DaGFuZ2VkRnJvbSgKICAg6QdoLvYG%2BMQjQXJt6ASNTHJv6AJNPMUcICAi6QOZyXXpBNUuIsZCIOsBrsURPiB8IEVycm9yyE4KICDkAKpl7gDr5wIU6AdtQWPEXkHkAOLGfugBp%2F8AqP8AqP8AqEHlAf%2FGTMhxPsYwU2NvcGUgPSBTdWJzY3JpcMRV5gClxRrGJcpTID3OYOQH0g%3D%3D&e=%40azure-tools%2Ftypespec-autorest&vs=%7B%7D

https://github.com/Azure/azure-rest-api-specs/blob/main/specification/terraform/Microsoft.AzureTerraform.Management/routes.tsp#L14

 
what is the expected way to write lro action?  ArmResponse<Employee>

```ts
@armResourceOperations
interface Terraform {
  @doc("Exports the Terraform configuration of the specified resource(s).")
  @tag("ExportTerraform")
  @useFinalStateVia("azure-async-operation")
  @returnTypeChangedFrom(
    Versions.`2021-10-01-preview`,
    ArmAcceptedLroResponse<
      "Resource operation accepted.",
      LroHeaders
    > | ErrorResponse
  )
  exportTerraform is ArmProviderActionAsync<
    Employee,
    ArmAcceptedLroResponse<
      "Resource operation accepted.",
      LroHeaders
    > | ArmResponse<Employee>,
    Scope = SubscriptionActionScope,
    LroHeaders = LroHeaders
  >;
}
```

What should service team do to poll? use AAO or location?