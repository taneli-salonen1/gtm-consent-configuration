___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GTM Consent Configuration",
  "categories": [
    "UTILITY"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Set the consent types for GTM to be used with the tags\u0027 consent checks. Adds a consent change listener for consent types that are granted later. This can be used as a consent granted trigger.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "configurationType",
    "displayName": "Configuration type",
    "radioItems": [
      {
        "value": "default",
        "displayValue": "default",
        "help": "Used when setting the initial consent status.",
        "subParams": [
          {
            "type": "RADIO",
            "name": "consentUpdateListener",
            "displayName": "Include consent update listener",
            "radioItems": [
              {
                "value": "yes",
                "displayValue": "Yes",
                "help": "Will push consent granted events to the dataLayer when consent types that weren\u0027t granted previously have been granted."
              },
              {
                "value": "no",
                "displayValue": "No"
              }
            ],
            "simpleValueType": true,
            "help": "",
            "defaultValue": "yes"
          }
        ]
      },
      {
        "value": "update",
        "displayValue": "update",
        "help": "Used when the consent preferences are updated."
      }
    ],
    "simpleValueType": true,
    "help": "The tag can be used to either set the default (initial) consent types or to update previously set consent types."
  },
  {
    "type": "TEXT",
    "name": "analytics_storage",
    "displayName": "analytics_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "TEXT",
    "name": "functionality_storage",
    "displayName": "functionality_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "TEXT",
    "name": "personalization_storage",
    "displayName": "personalization_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "TEXT",
    "name": "ad_storage",
    "displayName": "ad_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "TEXT",
    "name": "security_storage",
    "displayName": "security_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied"
  },
  {
    "type": "LABEL",
    "name": "label1",
    "displayName": "For documentation on Tag Manager Consent Types see: https://support.google.com/tagmanager/answer/10718549?hl\u003den"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const isConsentGranted = require('isConsentGranted');
const addConsentListener = require('addConsentListener');
const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const log = require('logToConsole');
const dataLayerPush = require('createQueue')('dataLayer');
const Object = require('Object');

const setConsentState = (input) => {
  if (input === 'granted' || input === true || input === 'true') {
    return 'granted';
  }
  return 'denied';
};

const addConsentUpdateDl = (consentType) => {
  let wasCalled = false;
  addConsentListener(consentType, (consentType, granted) => {
    // only send the dataLayer push once
    if (wasCalled) return;
    if (granted) {
      // send a consent granted event that can be used as a trigger
      dataLayerPush({
        event: consentType + '_granted'
      });
      wasCalled = true;
    }
  });
};

const consentSettings = {
  analytics_storage: setConsentState(data.analytics_storage),
  functionality_storage: setConsentState(data.functionality_storage),
  personalization_storage: setConsentState(data.personalization_storage),
  ad_storage: setConsentState(data.ad_storage),
  security_storage: setConsentState(data.security_storage),
  wait_for_update: data.configurationType === 'default' ? 500 : undefined
};

log(consentSettings);

if (data.configurationType === 'default') {
  setDefaultConsentState(consentSettings);

  // add a consent change listener for each consent type that were denied
  if (data.consentUpdateListener === 'yes') {
    for (let key of Object.keys(consentSettings)) {
      if (consentSettings[key] === 'denied') {
        addConsentUpdateDl(key);
      }
    }
  }
}

if (data.configurationType === 'update') {
  updateConsentState(consentSettings);
}

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "wait_for_update"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: setDefaultConsentState was called
  code: |
    const mockData = {
      analytics_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      ad_storage: 'denied',
      security_storage: 'denied',
      configurationType: 'default',
      consentUpdateListener: 'no'
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('addConsentListener').wasNotCalled();
    assertApi('dataLayerPush').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: updateConsentState was called
  code: |-
    const mockData = {
      analytics_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      ad_storage: 'denied',
      security_storage: 'denied',
      configurationType: 'update',
      consentUpdateListener: 'yes'
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('updateConsentState').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 5/30/2022, 2:50:55 PM


