#!/bin/bash

nifi_props_file=${NIFI_HOME}/conf/nifi.properties

prop_replace () {
  target_file=${3:-${nifi_props_file}}
  echo "Custom replacing [$1] to [$2] target file ${target_file}"
  sed -i -e "s|^$1=.*$|$1=$2|"  ${target_file}
}

prop_replace 'nifi.web.proxy.host' "${NIFI_WEB_PROXY_HOST}"

../scripts/start.sh
