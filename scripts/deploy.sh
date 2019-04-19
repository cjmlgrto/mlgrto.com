#!/bin/bash

(cd dist && ../tools/s3deploy/s3deploy -v -bucket "${S3_BUCKET}" -region "${S3_BUCKET_REGION}" -key "${AWS_KEY}" -secret "${AWS_SECRET}" -distribution-id "${AWS_DISTRIBUTION_ID}")