#!/bin/bash
host="zrdm60bcsmr01cmr001.eng.mobilephone.net"

token=`curl -SsL -k -X POST "https://$host:9080/npbc/auth-server" --header 'Content-Type: application/json' --data '{"userName":"sc423s","password":"S4nt14g0."}'`
jwttoken=`echo "${token}"| jq -r '.jwttoken'`

echo $jwttoken

whitelist=`curl -SsL -k -X POST "https://$host:9080/npbc/config/v1/whitelists" --header "Authorization: $jwttoken" --header "Content-Type: application/json" --data '{"name": "whitelist2","description" : "testing for imsi"}'`

statuscode=`echo "${whitelist}"| jq -r '.status'`
detail=`echo "${whitelist}"| jq -r '.detail'`

echo $statuscode
echo $detail