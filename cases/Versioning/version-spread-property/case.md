# Prompts

Adding `...Azure.ResourceManager.ManagedServiceIdentityProperty;` would update all my existing API versions and introduce a breaking change. I want is to introduce the property in a new API version 2025-05-04-preview only.

# Input
https://github.com/haolingdong-msft/innerloop-typespec-authoring-benchmark/blob/main/cases/Versioning/version-spread-property/main.tsp

# Output

## Plain Agent Output

### Claude Sonnet 4.5 output
![alt text](image.png)

### Expected Output
![alt text](image-1.png)


# Real case reference
[How to version a spread property (ManagedServiceIdentityProperty)?](https://teams.microsoft.com/l/message/19:906c1efbbec54dc8949ac736633e6bdf@thread.skype/1754356630816?tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&groupId=3e17dcb0-4257-4a30-b843-77f47f1d4121&parentMessageId=1754356630816&teamName=Azure%20SDK&channelName=TypeSpec%20Discussion&createdTime=1754356630816)