SECRET_JSON=$(sudo aws secretsmanager get-secret-value --secret-id "superstreamer-secrets" --query "SecretString" --output text)

rm -f .env
touch .env

echo 'S3_ENDPOINT="$(echo $SECRET_JSON | jq -r '.S3_ENDPOINT')"' >> .env
echo 'S3_REGION="$(echo $SECRET_JSON | jq -r '.S3_REGION')"' >> .env
echo 'S3_ACCESS_KEY="$(echo $SECRET_JSON | jq -r '.S3_ACCESS_KEY')"' >> .env
echo 'S3_SECRET_KEY="$(echo $SECRET_JSON | jq -r '.S3_SECRET_KEY')"' >> .env
echo 'S3_BUCKET="$(echo $SECRET_JSON | jq -r '.S3_BUCKET')"' >> .env
echo 'PUBLIC_S3_ENDPOINT="$(echo $SECRET_JSON | jq -r '.PUBLIC_S3_ENDPOINT')"' >> .env
echo 'SUPER_SECRET="$(echo $SECRET_JSON | jq -r '.SUPER_SECRET')"' >> .env
