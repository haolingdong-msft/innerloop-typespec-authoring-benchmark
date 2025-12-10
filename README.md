# innerloop-typespec-authoring-benchmark

A benchmark repository for TypeSpec authoring scenarios and common questions.

## Folder Structure

```
innerloop-typespec-authoring-benchmark/
├── cases/                          # Categorized TypeSpec authoring cases
│   ├── Decorators/                # Questions about TypeSpec decorators usage
│   ├── Operations/                # Questions about API operations definition
│   ├── Paging/                    # Questions about pagination patterns
│   ├── Patch/                     # Questions about PATCH operations
│   ├── Long Running Operation(LRO)/ # Questions about LRO implementation
│   ├── Versioning/                # Questions about API versioning
│   └── Arm Resource Manager(ARM) Template/ # Questions about ARM template selection
└── raw/                           # Raw source materials
    ├── references.md              # Reference documentation
    └── typespec-discussion-channel/ # Discussion channel archives
        └── typespec_*.md          # Weekly discussion snapshots
```


## Case Category

| Category | category code |
|----------|----------------|
| Versioning | 001 |
| Arm Resource Manager(ARM) Template | 002 |
| Long Running Operation(LRO) | 003 |
| Decorators | 004 |
| Operations | 005 |
| Patch | 006 |
| Paging | 007 |

Test case name conversion: `<category-code><case-number>-<case name>`

## Write a Test case

use [001001-version-spread-property](./cases/Versioning/001001-version-spread-property) as template to write a Test case.

**Folder structure of a test case**:
```

`<case name>`/
├── case.md                          # Test Case
├── tsp/                             # the typespe code folder
│   ├── main.tsp                
│   ├── ......                       
└── test result/                     # The results for each testing
    ├── <yyyy-mm-result>.md          # result of one test run
    └── ......
```
