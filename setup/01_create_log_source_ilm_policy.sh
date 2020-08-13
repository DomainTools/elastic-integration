#!/bin/bash

curl --location --request PUT 'ES_PROTOCOL://ES_HOST:ES_PORT/_ilm/policy/domaintools_policy' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic YOUR_BASE64_ENCODED_AUTH' \
--data-raw '{
    "policy": {
        "phases": {
            "hot": {
                "min_age": "0ms",
                "actions": {
                    "rollover": {
                        "max_size": "500mb",
                        "max_age": "1d"
                    },
                    "set_priority": {
                        "priority": 100
                    }
                }
            },
            "delete": {
                "min_age": "3d",
                "actions": {
                    "delete": {}
                }
            }
        }
    }
}'
