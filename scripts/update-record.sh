DOMAIN_RECORD=$( jq -n \
                  --arg domain "landing.polinom.io" \
                  '{"Comment": "CREATE/DELETE/UPSERT a record ","Changes": [{"Action": "CREATE","ResourceRecordSet": {"Name": $domain,"Type": "A","TTL": 300,"ResourceRecords": [{ "Value": "4.4.4.4"}]}}]}' )
echo $DOMAIN_RECORD

aws route53 change-resource-record-sets --hosted-zone-id ZXXXXXXXXXX --change-batch "$DOMAIN_RECORD"