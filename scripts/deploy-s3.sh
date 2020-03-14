#!/bin/bash
source .env
aws s3 sync ./www s3://$BUCKET_NAME

echo "http://$BUCKET_NAME.s3-website.$AWS_REGION.amazonaws.com"
