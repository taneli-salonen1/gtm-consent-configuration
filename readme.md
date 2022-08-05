# GTM Consent Configuration

This tag template is used to set and update the consent types in GTM. Once set, the consent settings can be used in GTM to allow/block tags from executing.

The tag can also add a consent granted listener. Once consent is updated and new consent types are granted, the tag will push events to the dataLayer listing all the newly granted consent types.

Example dataLayer push:

```
{
    "event": "analytics_storage_granted",
    "container_id": "GTM-ABCDEFG"
}
```
The container_id parameter can be used for event deduplication in case multiple consent listeners have been added by multiple GTM containers installed on the same page.