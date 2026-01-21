#!/usr/bin/bash

## @file
## @brief A set of functions to manipulate OpenSDN firewall rules
## @author Matvey Kraposhin

if [[ -v FWR_REST_FUNCTIONS ]]
then
    echo "The file fwr_rest_functions.sh has been already sourced"
    echo "Can not proceed"
    exit 0
fi

## @fn fwr_deny_specified_tag_endpoints
## @brief Creates settings for for a firewall rule that denies communication between
## two endpoints having the specified tag
function fwr_deny_specified_tag_endpoints () {
    local tag_fq_name="$1"
    local FWR_STR=
read -r -d '' FWR_STR <<- REQ_MARKER
    "action_list":  {
        "simple_action": "deny"
    },
    "direction": "<>",
    "endpoint_1":  {
        "tags":  [
            "$tag_fq_name"
        ]
    },
    "endpoint_2":  {
        "tags":  [
            "$tag_fq_name"
        ]
    },
    "match_tag_types":  {
        "tag_type":  []
    },
    "service":  {
        "protocol": "any",
        "dst_ports":  {
            "start_port": 0,
            "end_port": 65535
        },
        "src_ports":  {
            "start_port": 0,
            "end_port": 65535
        },
        "protocol_id": 0
    }
REQ_MARKER
    echo "$FWR_STR"
}

## @brief A guard variable to prevent recursive execution of fwr_rest_functions.sh
export FWR_REST_FUNCTIONS=

#
#END-OF-FILE
#