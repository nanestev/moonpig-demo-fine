resource "aws_lambda_function" "lambda-nodejs" {
  function_name = "${var.LambdaFunctionName}"
  
  # The path to the function's deployment package within the local 
  # filesystem. If defined, The s3_-prefixed options cannot be used.
  filename = "${var.LambdaPackageFilePath}"
  
  # The S3 bucket location containing the function's deployment 
  # package. Conflicts with filename. This bucket must reside in the 
  # same AWS region where you are creating the Lambda function.
  #s3_bucket = "terraform-serverless-example"
  
  # The S3 key of an object containing the function's deployment 
  # package. Conflicts with filename.
  #s3_key    = "v1.0.0/example.zip"

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "${var.LambdaFunctionHandler}"
  runtime = "${var.LambdaRuntime}"

  role = "${aws_iam_role.lambda_exec.arn}"

  tags {
    "mnpg:environment" = "${var.EnvironmentName}"
    "mnpg:name"        = "${var.TagNameValue}"
    "mnpg:owner"       = "${var.TagOwnerValue}"
    "mnpg:team"        = "${var.TagTeamValue}"
    "mnpg:workstream"  = "${var.TagWorkstreamValue}"
  }
}