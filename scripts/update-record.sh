DOMAIN_RECORD=$( jq -n \
                  --arg bn "arn:aws:s3:::$BUCKET_NAME/*" \
                  '{ Version:"2012-10-17",Statement:[{Sid:"PublicReadForGetBucketObjects",Effect:"Allow",Principal: "*",Action:["s3:GetObject"],"Resource":[$bn]}]}' )
echo $DOMAIN_RECORD

aws route53 change-resource-record-sets --hosted-zone-id ZXXXXXXXXXX --change-batch "$DOMAIN_RECORD"