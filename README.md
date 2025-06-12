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

### Day 13

Practiced checksums with SHA-1 using Terraform for S3 object management

- Created a new bucket with Terraform in s3/checksum-sha1/
- Uploaded a file (example.txt) and calculated its SHA-1 checksum to verify it didn't change
- Fixed an error by changing filebase64sha1 to base64encode(filesha1()) in Terraform
- Fixed another error by removing checksum_sha1 configuration, letting S3 calculate it automatically
- Compared the local SHA-1 checksum with the one S3 calculated to confirm the file didn't change
- Modified the file and saw how the SHA-1 checksum changed to show the file was different
- Learned that checksums like SHA-1 are like "huellas digitales" that check if a file changed, to make sure it arrives exactly the same
- Removed the bucket and file using terraform destroy

### Day 14

Practiced CORS with Terraform for S3 website hosting

- Created two buckets with Terraform in s3/cors-practice/: one for a website (cors-fun-ab-36252-luispenafiel-2025) and one for a JavaScript file (cors-fun2-ab-36252-luispenafiel-2025)
- Made the buckets into static websites so they can show web pages
- Added permissions to let everyone see the websites
- Added CORS rules to the first bucket so it can talk to an API (like asking for information from another website)
- Added CORS rules to the second bucket so the first bucket can use its JavaScript file (hello.js)
- Uploaded index.html to the first bucket and hello.js to the second bucket
- Tested the website and saw that it can load the JavaScript file thanks to CORS
- Saw two errors in the console: one because the API wasn't available (which is okay), and another from a Cloudflare script that isn't needed for this practice
- Learned that CORS is like giving permiso para que mi sitio web hable con otra página web, pero solo si es segura
- Removed the buckets and files using terraform destroy

### Day 15

Practiced encryption in S3 using Terraform and AWS CLI

- Created a bucket with Terraform in s3/encryption-practice/ (encryption-fun-ab-135-luispenafiel-2025)
- Uploaded a file (hello.txt) with SSE-S3 (a simple lock) and SSE-KMS (a lock with a special key) using Terraform
- Tried to use SSE-C (a lock with my own key) in Terraform, but it wasn't supported, so used AWS CLI instead
- Uploaded the file with SSE-C using AWS CLI and fixed a problem with checking the file by calculating the correct MD5 for the key
- Learned that encryption is like putting a lock on my files in S3 to keep them safe, and there are different ways to do it depending on who manages the key
- Removed the bucket and files using terraform destroy and AWS CLI commands

### 3 Weeks Terraform-practices(certification)

Day 1 - 12  June 2025

 Day01
- Practiced creating an S3 bucket with a policy restricting access to a specific IP using Terraform modules
- Set up a modular structure with a central provider and backend configuration
- Created the bucket successfully and verified the policy with my IP
- Learned that modules help organize and reuse Terraform code effectively
- Removed the bucket using terraform destroy

 Day02
- Practiced creating an EC2 instance with a web server (Apache) using Terraform modules
- Configured the instance with user_data to install Apache and display a custom webpage
- Successfully launched the instance and accessed the webpage after opening port 80 in the security group
- Learned how to automate server setup with user_data in EC2 and manage security group rules
- Removed the instance using terraform destroy