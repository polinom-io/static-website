#!/bin/bash
source .env

aws s3api create-bucket --bucket $BUCKET_NAME --region $AWS_REGION --profile $AWS_PROFILE

AWS_POLICY=$( jq -n \
                  --arg bn "arn:aws:s3:::$BUCKET_NAME/*" \
                  '{ Version:"2012-10-17",Statement:[{Sid:"PublicReadForGetBucketObjects",Effect:"Allow",Principal: "*",Action:["s3:GetObject"],"Resource":[$bn]}]}' )
echo $AWS_POLICY

aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy "$AWS_POLICY" --profile $AWS_PROFILE

aws s3 website s3://$BUCKET_NAME/ --index-document index.html --error-document error.html
 