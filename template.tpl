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
  "displayName": "GTM Consent Configuration (Consent Mode)",
  "categories": [
    "UTILITY"
  ],
  "brand": {
    "id": "github.com_taneli-salonen1",
    "displayName": "taneli-salonen1"
  },
  "description": "Set up consent in GTM to be used with the tags\u0027 consent additional checks or for Google Consent Mode. Can also include dataLayer events for detecting when consent has been granted.",
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
        "displayValue": "Default",
        "help": "Used when setting the \u003cstrong\u003einitial consent status\u003c/strong\u003e.",
        "subParams": [
          {
            "type": "RADIO",
            "name": "consentUpdateListener",
            "displayName": "Include consent update listener",
            "radioItems": [
              {
                "value": "yes",
                "displayValue": "Yes",
                "help": "Includes a consent update listener to those consent types that were set to \u003cstrong\u003edenied\u003c/strong\u003e. A dataLayer event will be pushed when a consent type becomes \u003cstrong\u003egranted\u003c/strong\u003e.\n\u003c/br\u003e\u003c/br\u003e\nBeware of side effects, such as duplicate dataLayer events, if multiple tags are set to include consent update listeners simultaneously."
              },
              {
                "value": "no",
                "displayValue": "No"
              }
            ],
            "simpleValueType": true,
            "help": "",
            "defaultValue": "yes"
          },
          {
            "type": "GROUP",
            "name": "additionalSettings",
            "displayName": "Additional settings",
            "groupStyle": "ZIPPY_CLOSED",
            "subParams": [
              {
                "type": "TEXT",
                "name": "region",
                "displayName": "Region (optional)",
                "simpleValueType": true,
                "help": "A comma separated list or a JS array of ISO 3166-2 region codes that specify to which regions the consent applies to. \u003c/br\u003e\u003c/br\u003e \u003cstrong\u003eLeave empty to apply to all regions.\u003c/strong\u003e \u003c/br\u003e\u003c/br\u003e Note that the region setting only applies to \"default\" consent."
              },
              {
                "type": "TEXT",
                "name": "waitForUpdate",
                "displayName": "Wait for update (optional)",
                "simpleValueType": true,
                "help": "Number of \u003cstrong\u003emilliseconds\u003c/strong\u003e to wait for a possible consent update. \u003c/br\u003e\u003c/br\u003e \u003cstrong\u003eOnly applies to Google tags.\u003c/strong\u003e \u003c/br\u003e\u003c/br\u003e Defaults to 500 milliseconds.",
                "valueValidators": [
                  {
                    "type": "NON_NEGATIVE_NUMBER"
                  }
                ]
              }
            ]
          }
        ]
      },
      {
        "value": "update",
        "displayValue": "Update",
        "help": "Used when the previously set consent preferences are \u003cstrong\u003eupdated\u003c/strong\u003e."
      },
      {
        "value": "listener",
        "displayValue": "Consent update listener only (DataLayer)",
        "help": "\u003cstrong\u003eOnly set up dataLayer consent update events.\u003c/strong\u003e\n\u003c/br\u003e\u003c/br\u003e\nThis option doesn\u0027t modify the consent mode consent types in GTM. It only creates consent update listeners that listen for changes in the visitor\u0027s preferences.\n\u003c/br\u003e\u003c/br\u003e\nThis can be useful if the CMP vendor\u0027s template or script is itself in charge of setting and managing the consents but doesn\u0027t provide proper dataLayer events for detecting the changes in the visitor\u0027s preferences.\n\u003c/br\u003e\u003c/br\u003e\nThe option generates a dataLayer event for each of the included consent types. The event fires when the consent type becomes granted.\n\u003c/br\u003e\u003c/br\u003e\nExample event: \u003cstrong\u003eanalytics_storage_granted\u003c/strong\u003e\n\u003c/br\u003e\u003c/br\u003e\n\u003cstrong\u003eIMPORTANT:\u003c/strong\u003e The consent listeners should be set \u003cstrong\u003eafter\u003c/strong\u003e the default consent has been set. For example, set default consent using the \u003cstrong\u003eConsent Initialization\u003c/strong\u003e trigger and add the consent listeners using the \u003cstrong\u003eInitialization\u003c/strong\u003e trigger.",
        "subParams": [
          {
            "type": "CHECKBOX",
            "name": "analytics_storage_listener",
            "checkboxText": "analytics_storage",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "functionality_storage_listener",
            "checkboxText": "functionality_storage",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "personalization_storage_listener",
            "checkboxText": "personalization_storage",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "ad_storage_listener",
            "checkboxText": "ad_storage",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "security_storage_listener",
            "checkboxText": "security_storage",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "ad_user_data_listener",
            "checkboxText": "ad_user_data",
            "simpleValueType": true,
            "defaultValue": true
          },
          {
            "type": "CHECKBOX",
            "name": "ad_personalization_listener",
            "checkboxText": "ad_personalization",
            "simpleValueType": true,
            "defaultValue": true
          }
        ]
      }
    ],
    "simpleValueType": true,
    "help": "The tag can be used to either set the default (initial) consent types or to update previously set consent types."
  },
  {
    "type": "LABEL",
    "name": "standard parameters",
    "displayName": "Standard consent parameters",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "analytics_storage",
    "displayName": "analytics_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "functionality_storage",
    "displayName": "functionality_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "personalization_storage",
    "displayName": "personalization_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "ad_storage",
    "displayName": "ad_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "security_storage",
    "displayName": "security_storage",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "denied",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "v2 parameters",
    "displayName": "Consent Mode V2 parameters",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "ad_user_data",
    "displayName": "ad_user_data",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "(not set)",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "ad_personalization",
    "displayName": "ad_personalization",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "(not set)",
    "enablingConditions": [
      {
        "paramName": "configurationType",
        "paramValue": "listener",
        "type": "NOT_EQUALS"
      }
    ]
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
const getContainerVersion = require('getContainerVersion');
const getType = require('getType');
const makeNumber = require('makeNumber');

const setConsentState = (input) => {
  if (input === '(not set)' || getType(input) === 'undefined') {
    // allow introducing new consent parameters through template updates without auto setting the parameters to denied
    return;
  }
  
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
      const eventName = consentType + '_granted';
      const cv = getContainerVersion();
      
      const dlEvent = {
        event: consentType + '_granted',
        container_id: cv.containerId // container_id can be used for event deduplication in case multiple containers are installed on the same page
      };

      // send a consent granted event that can be used as a trigger
      dataLayerPush(dlEvent);
      
      wasCalled = true;
    }
  });
};

// convert a string input value into JS array
const createList = (input) => {
  if (input) {
    if (getType(input) === 'string' && input.length > 0) {
      return input.split(',').map(item => item.trim());
    }
    if (getType(input) === 'array') {
      return input;
    }
  }
  
  return;
};

const waitForUpdate = makeNumber(data.waitForUpdate) >= 0 ? makeNumber(data.waitForUpdate) : 500;

const consentSettings = {
  analytics_storage: setConsentState(data.analytics_storage),
  functionality_storage: setConsentState(data.functionality_storage),
  personalization_storage: setConsentState(data.personalization_storage),
  ad_storage: setConsentState(data.ad_storage),
  security_storage: setConsentState(data.security_storage),
  ad_user_data: setConsentState(data.ad_user_data),
  ad_personalization: setConsentState(data.ad_personalization),
  region: data.configurationType === 'default' ? createList(data.region) : undefined,
  wait_for_update: data.configurationType === 'default' ? waitForUpdate : undefined
};

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

if (data.configurationType === 'listener') {
  const includedListeners = [
    'analytics_storage',
    'functionality_storage',
    'personalization_storage',
    'ad_storage',
    'security_storage',
    'ad_user_data',
    'ad_personalization'
  ].filter(consentType => {
    return data[consentType + '_listener'] === true;
  });
  
  includedListeners.forEach(consentType => {
    addConsentUpdateDl(consentType);
  });
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
                    "string": "ad_user_data"
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
                    "string": "ad_personalization"
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
                    "string": "region"
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
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
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
      consentUpdateListener: 'no',
      region: ['FI']
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


