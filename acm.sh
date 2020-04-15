#!/bin/bash -e

maNGERDOMAINNAME="test"
DefaultDomainName="test-sb.test.com"

getCertARN=" "
until [ -n "$getCertARN" -a "$getCertARN" != " " ]
do
  if [ $loop -eq 1 ]; then echo 'Requesting for getCertARN availability in ACM'; else echo 'getCertARN not yet available in ACM'; fi
  loop=$((loop+1))
  sleep 10
  getCertARN=$(aws acm request-certificate --domain-name "$maNGERDOMAINNAME.$DefaultDomainName" --validation-method DNS | jq -r .CertificateArn)
  echo "getCertARN=$getCertARN"
done

#getCertARN=$(aws acm list-certificates --query CertificateSummaryList[].[CertificateArn,DomainName] --output text | grep $DefaultDomainName | cut -f1)

# recordsetName=$(aws acm describe-certificate --certificate-arn $getCertARN --query 'Certificate.DomainValidationOptions' | jq -r .[].ResourceRecord.Name)
# echo "recordsetName=$recordsetName"

loop=1

recordsetName=" "
until [ -n "$recordsetName" -a "$recordsetName" != " " ]
do
  if [ $loop -eq 1 ]; then echo 'checking for recordsetName availability in ACM'; else echo 'recordsetName not yet available in ACM'; fi
  loop=$((loop+1))
  sleep 10
  recordsetName=$(aws acm describe-certificate --certificate-arn $getCertARN --query 'Certificate.DomainValidationOptions' | jq -r .[].ResourceRecord.Name)
  echo "recordsetName=$recordsetName"
done


# recordsetValue=$(aws acm describe-certificate --certificate-arn $getCertARN --query 'Certificate.DomainValidationOptions' | jq -r .[].ResourceRecord.Value)
# echo "recordsetValue=$recordsetValue"
loop=1

recordsetValue=" "
until [ -n "$recordsetValue" -a "$recordsetValue" != " " ]
do
  if [ $loop -eq 1 ]; then echo 'checking for recordsetValue availability in ACM'; else echo 'recordsetValue not yet available in ACM'; fi
  loop=$((loop+1))
  sleep 10
  recordsetValue=$(aws acm describe-certificate --certificate-arn $getCertARN --query 'Certificate.DomainValidationOptions' | jq -r .[].ResourceRecord.Value)
  echo "recordsetValue=$recordsetValue"
done
