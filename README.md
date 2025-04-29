# AWS-Examples-Freecodecamp-AWS-Solutions-Architect-Associate-Certification-


## Update of the Project

### Day 4

Add S3 management scripts and DevContainer setup

- Created scripts: create-bucket, delete-bucket, list-object, put-object, sync, list-buckets
- Configured put-object and sync to generate random .txt files (myfile2_1.txt, etc.) and upload to S3
- Set up DevContainer with AWS CLI, tree, and jq for Codespaces
- Fixed syntax errors, improved file generation, and added bucket listing with jq

### Day 5

Add delete-objects script and test S3 scripts

- Created delete-objects script to remove all objects from an S3 bucket
- Tested put-object with /tmp/newfile.txt and confirmed successful upload
- Tested delete-objects on my-new-shinny-bucket-lp and verified bucket is empty
- Documented all S3 scripts commands in aws-scripts-commands.txt

### Day 6
- Created sdk java, ruby
- Install java & ruby
- Modify & Tested setup.sh and devcontainer for clarity

### Flu Week
- bed
- Vit.C, Vit.D, Zinc, Magnesium, Honey + Salbei

### Day 7
Set up Ruby SDK and tested S3 operations

- Installed Ruby, Bundler, and configured Gemfile with aws-sdk-s3, pry, nokogiri
- Tested s3.rb: created buckets, generated UUID files, uploaded to S3, and debugged with binding.pry
- Documented commands in s3-ruby-commands.txt
- Never download vendor locally

### Day 8

Practiced Infrastructure as Code (IaC) with AWS CloudFormation for S3

- Created s3/iac/cfn/ directory with deploy and delete-stack scripts
- Defined template.yaml to create a simple S3 bucket via CloudFormation
- Deployed cfn-s3-simple stack in eu-central-1, reviewed and executed changeset
- Deleted stack and cleaned up resources using delete-stack script

### Day 9

Set up Terraform for IaC in devcontainer

- Modified devcontainer.json to install Terraform automatically
- Installed unzip and downloaded Terraform v1.11.3
- Added Terraform binary to /usr/local/bin/ for global access
- Moved AWS credentials to Codespaces Secrets for secure access
- Removed Ruby project (s3/sdk/ruby/) to resolve Dependabot vulnerabilities in nokogiri
- Updated setup.sh to remove ruby-full installation

### Day 10

Structured Terraform scripts for S3 bucket management

- Created main.tf to define AWS provider and region (eu-central-1)
- Created s3.tf to define an S3 bucket with a specific name and detailed tags
- Updated .gitignore to exclude Terraform-generated files and sensitive data (.tfstate, .tfvars, crash logs, etc.)
- Planned and applied Terraform configuration to create the S3 bucket in AWS

### Pascua

### Day 11

Explored Pulumi as an alternative IaC tool

- Installed Pulumi CLI and added it to the $PATH for usage
- Corrected $PATH setup by using source ~/.bashrc instead of incorrect .bash file
- Set up a Python project in s3/iac/pulumi/
- Created a Pulumi script to define an S3 bucket with detailed tags
- Deployed the S3 bucket using pulumi up
- Removed the S3 bucket using pulumi destroy
- Created a second Pulumi project in s3/iac/pulumi-new/ to practice project initialization
- Verified that no sensitive or heavy files are uploaded to GitHub (using .gitignore)

### Day 12

Practiced ETags with Terraform for S3 object management

- Updated main.tf to create an S3 bucket with versioning enabled
- Changed bucket name to my-terraform-etag-bucket-luispenafiel-2025-v2 to avoid conflicts
- Uploaded an object (myfile.txt) and used ETags to verify integrity
- Modified the object and observed the ETag change with Terraform
- Added conditional ETag checks to manage multiple versions of the object
- Corrected errors by removing obsolete resource from state and updating ETag condition
- Fixed ETag mismatch by correcting the content of myfile-v2.txt to match the expected ETag
- Cleaned up non-managed versions of the object using aws s3api delete-object
- Removed the S3 bucket and object using terraform destroy

Practiced changing storage class with AWS CLI for S3 object management

- Created a bucket using aws s3 mb command
- Uploaded a file (hello.txt) with the storage class STANDARD_IA using aws s3 cp
- Changed the storage class to STANDARD by copying the file with aws s3 cp again
- Learned that we can talk directly to S3 with commands in the terminal to change where a file is stored
- Removed the file and bucket using aws s3 rm and aws s3 rb