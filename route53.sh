#!/bin/bash -e

maNGERDOMAINNAME="test"
DefaultDomainName="test-sb.test.com"

GetRoute53HostedZone=$(aws route53 list-hosted-zones-by-name --dns-name $DefaultDomainName --query HostedZones[].Id --output text | cut -d/ -f3)
echo "GetRoute53HostedZone=$GetRoute53HostedZone"
