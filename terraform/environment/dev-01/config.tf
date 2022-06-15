provider "aws" {
  region = "${var.region}"
  profile = "dev-01"
}

variable "region"               {default = "eu-west-2"}
variable "jar_file"             {default = "aws-terraform-stepfunction-demo-1.0.0-SNAPSHOT.jar"}
variable "environment_prefix"   {default = "dev-01"}
variable "lambda_role_arn"      {default = "arn:aws:iam::802127191073:role/lamba-role"}

module "core" {
  source                    = "../../module/core"
  region                    = "${var.region}"
  jar_file                  = "${var.jar_file}"
  sns_topic                 = ""
  environment_prefix        = "${var.environment_prefix}"
  lambda_role_arn           = "${var.lambda_role_arn}"
}
