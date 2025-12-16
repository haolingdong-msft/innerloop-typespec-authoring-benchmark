# TypeSpec Discussion Questions Summary

## Overview
This folder contains categorized TypeSpec discussion questions from May 2025 to December 2025.

**Total Questions**: 159 questions across 21 files  
**All questions categorized**: 159 (100.0%)

---

## Questions by File

| File | Total Questions |
|------|----------------|
| typespec_2025_05_22.md | 45 |
| typespec_2025_06_26.md | 33 |
| typespec_2025_07_03.md | 13 |
| typespec_2025_07_10.md | 3 |
| typespec_2025_07_17.md | 6 |
| typespec_2025_07_24.md | 7 |
| typespec_2025_07_31.md | 4 |
| typespec_2025_08_07.md | 3 |
| typespec_2025_08_14.md | 6 |
| typespec_2025_09_12.md | 3 |
| typespec_2025_09_19.md | 3 |
| typespec_2025_09_26.md | 2 |
| typespec_2025_10_10.md | 9 |
| typespec_2025_10_17.md | 3 |
| typespec_2025_10_24.md | 2 |
| typespec_2025_10_31.md | 2 |
| typespec_2025_11_07.md | 3 |
| typespec_2025_11_14.md | 1 |
| typespec_2025_11_21.md | 6 |
| typespec_2025_11_28.md | 3 |
| typespec_2025_12_05.md | 2 |
| **Total** | **159** |

---

## Questions by Category

| Category | Question Count | Percentage |
|----------|----------------|------------|
| Versioning | 32 | 19.5% | 4
| Arm Resource Manager(ARM) Template | 6 | 3.7% |3
| Long Running Operation(LRO) | 14 | 8.5% | 3
| Decorators | 22 | 13.4% | 2/3
| Operations | 10 | 6.1% | 1
| Patch | 5 | 3.0% | 1
| Paging | 3 | 1.8% | 1

---

## Category Distribution Analysis

### Top 5 Categories
1. **TypeSpec Validation** (36 questions, 22.0%) - Most common questions relate to validation errors, CI failures, and spec compliance
2. **Versioning** (32 questions, 19.5%) - Questions about API versioning, version management, and version-specific changes
3. **SDK Generation** (24 questions, 14.6%) - Issues with SDK generation, language-specific code generation
4. **Decorators** (22 questions, 13.4%) - Questions about TypeSpec decorator usage and syntax
5. **Long Running Operation(LRO)** (14 questions, 8.5%) - Questions about asynchronous operations and LRO patterns

### Category Definitions
Categories are based on the intent classification from:
https://github.com/Azure/azure-sdk-tools/blob/main/tools/sdk-ai-bots/azure-sdk-qa-bot-backend/service/prompt/typespec/intention.md

---

## Monthly Distribution

| Month | Files | Total Questions |
|-------|-------|-----------------|
| May 2025 | 1 | 45 |
| June 2025 | 1 | 33 |
| July 2025 | 4 | 33 |
| August 2025 | 2 | 9 |
| September 2025 | 3 | 8 |
| October 2025 | 4 | 16 |
| November 2025 | 4 | 13 |
| December 2025 | 1 | 2 |
| **Total** | **21** | **159** |

---

## Categorization Complete! ✅

All 159 questions across all 21 files have been successfully categorized according to the intent categories from the GitHub repository.

---

## Complete Question List by Category

**Legend:** 🎮 = Question includes TypeSpec playground example

### Versioning (32 questions)

- [Default value starting from a specific API version?](typespec_2025_05_22.md) (selected)
- [Description changes across versions?](typespec_2025_05_22.md) (ignore)
- [First experience of TSP ApiVersion introduction - passed all CI checks, what's next?](typespec_2025_05_22.md) (ignore)
- [How to restrict importing typespec files in main based off of versions.](typespec_2025_05_22.md) (ignore, general agent supported)
- [Is there way to change property from required to optional?](typespec_2025_05_22.md) (selected)
- [Model validation failures - Newer models introduced in new version adds the parent models in the older version.](typespec_2025_05_22.md)
- [Proper Service Versioning](typespec_2025_05_22.md) 🎮
- [Setting default value for a union type for only some API versions](typespec_2025_05_22.md)
- [Sharing models between data plane and control plane](typespec_2025_05_22.md)
- [Breaking Change(Cross-Version) failure](typespec_2025_06_26.md)
- [Can I have different Name Regex for ARM Resource for different api versions?](typespec_2025_06_26.md)
- [Handling multiple API versions using typespec](typespec_2025_06_26.md)
- [help with @added(multipleversion) vs @removed(oldversion)](typespec_2025_06_26.md)
- [How to change the model to accommodate new decorators for validations](typespec_2025_06_26.md)
- [Is adding new value to enum is considered a breaking change?](typespec_2025_06_26.md)
- [Is it possible to make a field to be optional only on new api version?](typespec_2025_06_26.md)
- [Need advice on how to change operation parameters on a breaking change](typespec_2025_06_26.md) 🎮
- [relaxing a pattern across versions](typespec_2025_06_26.md) 🎮
- [Avocado error after @renamedFrom on custom action route](typespec_2025_07_03.md)
- [Can required fields have default values?](typespec_2025_07_03.md) 🎮
- [How to update any model without affecting old API versions](typespec_2025_07_03.md)
- [Will changing the delete method on a tracked resource be a breaking change?](typespec_2025_07_03.md)
- ["is referencing versioned type but is not versioned"](typespec_2025_07_17.md)
- [TypeSpec Versioning Generic Question](typespec_2025_07_24.md)
- [How to version a spread property (ManagedServiceIdentityProperty)?](typespec_2025_08_07.md) 🎮
- [Modify/rename @resource(s)](typespec_2025_08_14.md)
- [Changing Property to Optional with Default](typespec_2025_09_26.md) 🎮
- [Can we reorder the API versions like this, and should we remove the older preview version?](typespec_2025_10_10.md)
- [How to generate multiple inline allOfs (or equivalent)](typespec_2025_10_10.md)
- [What decorator should be used in this case?](typespec_2025_10_10.md)
- [Versioning question with new GA after preview](typespec_2025_10_24.md)
- [Problems Introducing Versioned Name Pattern](typespec_2025_12_05.md) 🎮

### Decorators (22 questions)

- [Augmented decorators on resource in the multi-path scenario](typespec_2025_05_22.md)
- [Customizing key for child operation](typespec_2025_05_22.md)
- [Discriminators/polymorphism](typespec_2025_05_22.md)
- [Extending 'Azure.ResourceManager.CommonTypes.ProxyResource' that doesn't define a discriminator.](typespec_2025_05_22.md)
- [Multiple layers of inheritance for discriminative model](typespec_2025_05_22.md)
- [Seeking Guidance on Defining ResourceStatusCode in TypeSpec](typespec_2025_05_22.md)
- [Support for @includeInapplicableMetadataInPayload decorator](typespec_2025_05_22.md)
- [Array items with length constraints](typespec_2025_06_26.md)
- [Best way to model a DaysOfWeek Enum/Union?](typespec_2025_06_26.md)
- [Does TypeSpec have the option to achieve mutually exclusive?](typespec_2025_06_26.md)
- [Record<Element> type](typespec_2025_06_26.md)
- [Visibility Choice](typespec_2025_06_26.md)
- [Parameter naming](typespec_2025_07_03.md)
- [Parameterizing @doc through interface value params](typespec_2025_07_03.md)
- [Does typespec allow negative lookaheads in name validation?](typespec_2025_07_10.md)
- [how to set readOnly for union](typespec_2025_07_17.md)
- [Best replacement for char in TypeSpec?](typespec_2025_07_24.md) 🎮
- [Updating from `@typespec/compiler@^0.65.0` -> `1.2.0`. Changes to `@service` decorator.](typespec_2025_07_24.md)
- [how do i use discriminated union](typespec_2025_10_10.md)
- [Multiple default values](typespec_2025_10_10.md)
- [Use open API x-ms-client-flatten: true in model](typespec_2025_11_21.md)
- [Unable to apply client flatten to a top level resource property.](typespec_2025_11_28.md)

### Long Running Operation(LRO) (14 questions)

- [Additional OKResponse](typespec_2025_05_22.md)
- [Discrepancy in the original LRO response and Status Monitor Response](typespec_2025_05_22.md)
- [How to customize "original-uri" in arm template?](typespec_2025_05_22.md)
- [Need help in Adding final-state-schema for a single post action](typespec_2025_05_22.md) 🎮 (a very strange case)
- [Non-resource long running operation](typespec_2025_05_22.md)
- [Resource Action LRO response modelling](typespec_2025_05_22.md)
- [What is `x-ms-long-running-operation-options` for LRO operation of data-plane when `emit-lro-options: none` in `@azure-tools/typespec-autorest`?](typespec_2025_05_22.md)
- [Asynchronous resource delete](typespec_2025_06_26.md) 🎮
- [Does it make sense for a put operation with Location header?](typespec_2025_07_03.md) 🎮
- [Issue with LongRunningResourceCreateWithServiceProvidedName operation](typespec_2025_07_03.md)
- [How to suppress 200 response code for a LongRunningOperation?](typespec_2025_08_07.md)
- [Versioning the LRO headers](typespec_2025_10_10.md) 🎮
- [Guidance on cross version breaking change for readonly and async operations in new api-versions](typespec_2025_11_14.md)
- [ARM Async operation with custom operation](typespec_2025_11_21.md) 🎮 (answer is using legacy)

### TypeSpec Migration (11 questions)

- [Brownfield TypeSpec migration](typespec_2025_05_22.md)
- [Question regarding the unexpected readonly, and customize the enum name](typespec_2025_05_22.md)
- [Readonly on model](typespec_2025_05_22.md)
- [Swagger breaking change](typespec_2025_06_26.md)
- [Untitled](typespec_2025_06_26.md)
- [Unresolved Breaking changes](typespec_2025_07_10.md)
- [Is TypeSpec migration complete for folder: recoveryservicesbackup.](typespec_2025_09_26.md)
- [Service under conversation label](typespec_2025_10_10.md)
- [Unknown decorator @flattenProperty](typespec_2025_10_17.md)
- [RT registration for Type Spec folder with multiple swagger files](typespec_2025_10_31.md)
- [Questions About Maintaining TypeSpec and Reducing Learning Costs](typespec_2025_11_28.md)

### Operations (10 questions)

- [Exclude property from list that is in create/update/get](typespec_2025_05_22.md)
- [Is path case sensitive?](typespec_2025_05_22.md)
- [Override contentType: "application/json" for ResourceCreateOrUpdate](typespec_2025_05_22.md)
- [Update API definition in typespec-providerhub](typespec_2025_05_22.md)
- [Upper case in action segment](typespec_2025_06_26.md) 🎮
- [Operation Id update](typespec_2025_07_03.md) 🎮
- [Define Proxy object with 200/202 Http response](typespec_2025_07_31.md)
- [TypeSpec API Operations](typespec_2025_10_10.md)
- [Quantum RP, add new filter to offering API](typespec_2025_11_07.md)
- [Playground usage](typespec_2025_11_21.md) 🎮

### Arm Resource Manager(ARM) Template (6 questions)

- [Annotate same model with SubscriptionLocationResource and ResourceGroupLocationResource](typespec_2025_05_22.md)
- [Extend ResourceModelWithAllowedPropertySet](typespec_2025_05_22.md)
- [Two kinds of extension resource](typespec_2025_06_26.md)
- [Using namespaces and encountering duplicate-symbol error](typespec_2025_06_26.md)
- [We cannot customize the Type for ResourceNameParameter?](typespec_2025_06_26.md) 🎮
- [Location based extension resource off a tenant level resource](typespec_2025_07_17.md)

### Patch (5 questions)

- [JSON merge-patch support in TypeSpec](typespec_2025_05_22.md)
- [Guidelines to Implement Custom Patch](typespec_2025_07_17.md) 🎮
- [Allow property update only through PUT and not Patch](typespec_2025_11_21.md)
- [ArmResourcePatchAsync & discriminator](typespec_2025_11_21.md)
- [Moving from ArmCustomPatchSync to ArmResourcePatchSync for PATCH operations](typespec_2025_11_21.md)

### Paging (3 questions)

- [Support for pagination](typespec_2025_05_22.md)
- [Paged Operation list return type](typespec_2025_08_14.md)
- [pageItems](typespec_2025_08_14.md)

---

*Last updated: January 2025*
