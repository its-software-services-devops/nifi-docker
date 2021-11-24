#!/bin/bash

nifi_props_file=${NIFI_HOME}/conf/nifi.properties

prop_replace () {
  target_file=${3:-${nifi_props_file}}
  echo "Custom replacing [$1] to [$2] target file ${target_file}"
  sed -i -e "s|^$1=.*$|$1=$2|"  ${target_file}
}

prop_replace 'nifi.web.proxy.host' "${NIFI_WEB_PROXY_HOST}"
prop_replace 'nifi.cluster.is.node' "${CUSTOM_NIFI_CLUSTER_IS_NODE:-false}"
prop_replace 'nifi.cluster.node.protocol.port' "${CUSTOM_NIFI_CLUSTER_NODE_PROTOCOL_PORT}"

../scripts/start.sh
