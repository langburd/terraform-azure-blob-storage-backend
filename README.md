# Create S3 backend for your Terraform AWS project

Prerequisites:

- AWS CLI is installed. See [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).
- AWS CLI is configured. Run ```aws configure --profile <customer-name>```

Change ```variables.tf``` with your info.

Run ```terraform init```

Run ```terraform apply```

The name of the bucket you can check with the command ```terraform output s3_bucket```

Name of the DynamoDB table you can check with the command ```terraform output dynamodb_table_name```

Add the file ```example\backend.tf``` to your project and edit if needed. 
