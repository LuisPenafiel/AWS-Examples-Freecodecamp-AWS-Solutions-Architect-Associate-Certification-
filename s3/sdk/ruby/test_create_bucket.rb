# Required libraries
require 'aws-sdk-s3'

# S3 Bucket configuration
bucket_name = ENV['BUCKET_NAME'] || 'my-new-shinny-bucket-lp'
region = 'eu-central-1'

# Verify bucket name is not empty
if bucket_name.nil? || bucket_name.empty?
  puts "Error: BUCKET_NAME environment variable is not set and no default provided."
  exit 1
end

# Initialize AWS S3 client
client = Aws::S3::Client.new(region: region)

# Create S3 bucket if it doesn't exist
begin
  client.head_bucket(bucket: bucket_name)
  puts "Bucket #{bucket_name} already exists."
rescue Aws::S3::Errors::NotFound
  begin
    resp = client.create_bucket({
      bucket: bucket_name,
      create_bucket_configuration: {
        location_constraint: region
      }
    })
    puts "Bucket #{bucket_name} created successfully."
  rescue Aws::S3::Errors::ServiceError => e
    puts "Error creating bucket: #{e.message}"
    exit 1
  end
rescue Aws::S3::Errors::ServiceError => e
  puts "Error accessing bucket: #{e.message}"
  exit 1
end
