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

## Included consent types

The template supports all default GTM consent types that can be used to block or to allow a tag to fire.

https://support.google.com/tagmanager/answer/10718549?hl=en#consent-types

Additionally, the tag template supports the new Consent Mode V2 parameters: ad_user_data & ad_personalization.

https://support.google.com/tagmanager/answer/13695607

## Implementation example with OneTrust

This blog post goes through how you can use the tag template for integrating OneTrust with GTM's consent configuration: https://tanelytics.com/integrate-onetrust-with-google-tag-manager/