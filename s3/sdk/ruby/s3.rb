# Required libraries
require 'aws-sdk-s3'  # AWS SDK for S3 operations
require 'pry'         # Interactive shell for debugging
require 'securerandom' # For generating secure random strings (UUIDs)

# S3 Bucket configuration
bucket_name = ENV['BUCKET_NAME'] || 'my-new-shinny-bucket-lp'  # Fetch bucket name from environment or use default
region = 'eu-central-1'           # AWS region where the bucket is located

# Verify bucket name is not empty
if bucket_name.nil? || bucket_name.empty?
  puts "Error: BUCKET_NAME environment variable is not set and no default provided."
  exit 1
end

# Initialize AWS S3 client
client = Aws::S3::Client.new(region: region)  # Specify the region explicitly

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

 #binding.pry

# Determine the number of files to create and upload
number_of_files = 1 + rand(6)     # Generating a random number between 1 and 6
puts "number_of_files: #{number_of_files}"

# Loop to create and upload each file
number_of_files.times.each do |i|
  puts "i: #{i}"
  filename = "file_#{i}.txt"      # Generating a filename for each file
  output_path = "/tmp/#{filename}"# Specifying the output path for the file

  # Writing a unique UUID to each file
  begin
    File.open(output_path, "w") do |f|
      f.write(SecureRandom.uuid)    # Write a random UUID to the file
    end
  rescue StandardError => e
    puts "Error writing to file #{filename}: #{e.message}"
    next
  end

  # Open and read the file in binary mode, then upload it to S3
  begin
    File.open(output_path, 'rb') do |f|  # 'rb' mode for reading binary data
      client.put_object(                # Uploading the file to S3
        bucket: bucket_name,            # Bucket to upload to
        key: filename,                  # Key (filename) for the object in the bucket
        body: f                         # File content
      )
      puts "Uploaded #{filename} to S3."
    end
  rescue Aws::S3::Errors::ServiceError => e
    puts "Error uploading #{filename}: #{e.message}"
    next
  end
end