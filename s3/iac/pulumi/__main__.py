"""An AWS Python Pulumi program"""

import pulumi
import pulumi_aws as aws

# Crear un bucket de S3
bucket = aws.s3.Bucket(
    "my-s3-bucket",
    bucket="my-pulumi-bucket-luispenafiel-2025",
    tags={
        "Name": "My bucket",
        "Environment": "Dev",
        "Owner": "LuisPenafiel",
        "Project": "AWS-Examples-Day11"
    }
)

# Exportar el nombre del bucket
pulumi.export("bucket_name", bucket.bucket)