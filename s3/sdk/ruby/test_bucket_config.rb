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

puts "Bucket Name: #{bucket_name}"
puts "Region: #{region}"
