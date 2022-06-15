# aws-terraform-stepfunction-demo
A basic example of an AWS Step Function using Lambdas with Terraform

### AWS CLI authentication

You will need a user with relevant privileges, its 'access key', 'secret key' and region for the profile. In this example I used London (eu-west-2)
````bash
$ aws configure --profile dev-01
````

### Build the project

In root folder, build the project with Maven:
````bash
$ mvn clean package install
````

### Initialise Terraform

Update 'terraform/vars.tf' otherwise my defaults will be used. Then, in the terraform/environment/dev-01 folder, initialise Terraform:
````bash
$ terraform init
````

### Review/apply changes to AWS
````bash
$ terraform apply
````

### To destroy
````bash
$ terraform destroy
````

### Simulate an event to execute the Step Function

In the AWS console, look for Step Functions and test its execution using the following JSON:
````bash
{
	"event": {
		"Records": [
			{
				"s3": {
					"bucket": {
						"name": "spikything-demo01"
					},
					"object": {
						"key": "test-files/test.json"
					}
				}
			}
		]
	}
}
````
