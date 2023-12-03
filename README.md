Deploy AWS Infrastructures with Terraform and GitHub Actions.

Create aws s3 bucket for terraform.tfstate: 
aws s3api create-bucket --bucket "terraform-cicd-with-github-actions"

Create aws dynamodb table for LockID version:
aws dynamodb create-table \
  --table-name terraform-cicd-with-github-actions \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
