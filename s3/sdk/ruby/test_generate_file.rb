# Required libraries
require 'securerandom'

# Generate a single file
filename = "file_test.txt"
output_path = "/tmp/#{filename}"

# Writing a unique UUID to the file
begin
  File.open(output_path, "w") do |f|
    f.write(SecureRandom.uuid)
    puts "File #{filename} created with UUID: #{SecureRandom.uuid}"
  end
rescue StandardError => e
  puts "Error writing to file #{filename}: #{e.message}"
  exit 1
end

# Read and print the file content
begin
  content = File.read(output_path)
  puts "File content: #{content}"
rescue StandardError => e
  puts "Error reading file #{filename}: #{e.message}"
  exit 1
end
