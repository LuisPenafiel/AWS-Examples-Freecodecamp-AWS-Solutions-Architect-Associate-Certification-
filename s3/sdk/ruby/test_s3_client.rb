# Required libraries
require 'aws-sdk-s3'

# S3 Bucket configuration
region = 'eu-central-1'

# Initialize AWS S3 client
begin
  client = Aws::S3::Client.new(region: region)
  puts "S3 client initialized successfully with region: #{region}"
rescue StandardError => e
  puts "Error initializing S3 client: #{e.message}"
  exit 1
end
