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
