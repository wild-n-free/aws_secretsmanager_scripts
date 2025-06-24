# AWS Secrets Deletion Script

This shell script automates the process of deleting multiple AWS Secrets Manager secrets by reading secret names from a file and issuing delete commands using the AWS CLI.

## 🚀 Features

- Reads a list of AWS Secrets Manager secret names from a file.
- Deletes each listed secret in your specified AWS profile and region.
- Checks for prerequisites like the AWS CLI and file existence.
- Provides success/failure feedback for each deletion.

## 📋 Prerequisites

- **AWS CLI installed**  
  [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) if not already installed.

- **Configured AWS CLI credentials**  
  Run `aws configure --profile your_aws_profile` to set credentials for the desired profile.

- **A file containing secret names**  
  One secret name per line, for example:
  ```
  my/secret/one
  another/secret/name
  yet/another/secret
  ```

## ⚙️ Configuration

Before running the script, update these variables at the top of the file:

```bash
AWS_PROFILE="your_aws_profile"      # Set your AWS CLI profile name
AWS_REGION="your_aws_region"        # Set your AWS region, e.g., us-west-2
SECRETS_FILE="your_file_with_secrets.txt"  # Replace with the actual path to your secrets list
```

## 🛠️ Usage

1. Make the script executable:
   ```bash
   chmod +x delete_aws_secrets.sh
   ```

2. Run the script:
   ```bash
   ./delete_aws_secrets.sh
   ```

## 🧪 Example Output

```
Deleted secret: my/secret/one
Deleted secret: another/secret/name
Failed to delete secret: non_existent/secret
```

## ⚠️ Important Notes

- Deleted secrets are not immediately removed. AWS retains them for 7 days by default unless you add the `--force-delete-without-recovery` flag.
- Be careful—deleting secrets is irreversible after the recovery window expires.

## 📄 License

This script is provided "as is" without warranty of any kind. Use at your own risk.
