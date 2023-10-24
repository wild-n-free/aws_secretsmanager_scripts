#!/bin/bash

# Define the AWS CLI profile and region (modify as needed)
AWS_PROFILE="your_aws_profile"
AWS_REGION="your_aws_region"

# Input file containing secret names, one per line
SECRETS_FILE="the_filename_with_the_list_of_secrets.extion"

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and configure your AWS credentials."
    exit 1
fi

# Check if the secrets file exists
if [ ! -f "$SECRETS_FILE" ]; then
    echo "Secrets file not found: $SECRETS_FILE"
    exit 1
fi

# Loop through each secret name in the file and delete it
while IFS= read -r secret_name
do
    # Delete the secret
    aws secretsmanager delete-secret --profile "$AWS_PROFILE" --region "$AWS_REGION" --secret-id "$secret_name"
    
    if [ $? -eq 0 ]; then
        echo "Deleted secret: $secret_name"
    else
        echo "Failed to delete secret: $secret_name"
    fi
done < "$SECRETS_FILE"
