resource "aws_lambda_function" "demo-validate" {
  function_name     = "${var.environment_prefix}-demo-validate"
  handler       = "com.github.demo.aws.lambda.ValidateLambda::handleRequest"
  runtime       = "java8"
  role          = "${var.lambda_role_arn}"
  filename          = "../../../target/${var.jar_file}"
  source_code_hash = "${filebase64("../../../target/${var.jar_file}")}"
  memory_size   = 512
  timeout       = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}

resource "aws_lambda_function" "demo-process" {
  function_name     = "${var.environment_prefix}-demo-process"
  handler       = "com.github.demo.aws.lambda.ProcessLambda::handleRequest"
  runtime       = "java8"
  role          = "${var.lambda_role_arn}"
  filename          = "../../../target/${var.jar_file}"
  source_code_hash = "${filebase64("../../../target/${var.jar_file}")}"
  memory_size   = 512
  timeout       = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}

resource "aws_lambda_function" "demo-exception" {
  function_name     = "${var.environment_prefix}-demo-exception"
  handler       = "com.github.demo.aws.lambda.ExceptionLambda::handleRequest"
  runtime       = "java8"
  role          = "${var.lambda_role_arn}"
  filename          = "../../../target/${var.jar_file}"
  source_code_hash = "${filebase64("../../../target/${var.jar_file}")}"
  memory_size   = 512
  timeout       = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}
