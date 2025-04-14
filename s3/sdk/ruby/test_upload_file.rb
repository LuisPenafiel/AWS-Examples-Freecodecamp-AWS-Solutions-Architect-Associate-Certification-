# Required libraries
require 'aws-sdk-s3'

# S3 Bucket configuration
bucket_name = ENV['BUCKET_NAME'] || 'my-new-shinny-bucket-lp'
region = 'eu-central-1'

# Initialize AWS S3 client
client = Aws::S3::Client.new(region: region)

# Upload a single file
filename = "file_test.txt"
output_path = "/tmp/#{filename}"

# Ensure the file exists (create it if necessary)
unless File.exist?(output_path)
  File.open(output_path, "w") do |f|
    f.write("Test content")
  end
end

# Open and read the file in binary mode, then upload it to S3
begin
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
    puts "Uploaded #{filename} to S3."
  end
rescue Aws::S3::Errors::ServiceError => e
  puts "Error uploading #{filename}: #{e.message}"
  exit 1
end
