terragrunt = {
  terraform {
    source = "../../../../modules/lambda"
    extra_arguments "custom_vars" {
      commands = [
        "apply",
        "plan",
        "import",
        "push",
        "refresh",
        "destroy"
      ]
      arguments = [
        "-var-file=${get_tfvars_dir()}/../../../core.tfvars",
        "-var-file=${get_tfvars_dir()}/../../test.tfvars",
        "-var-file=terraform.tfvars"
      ]
    }
  }
  include = {
    path = "${find_in_parent_folders("terragrunt.tfvars")}"
  }
}

LambdaFunctionName = "HelloLambdaNodejs"
LambdaRuntime = "nodejs8.10"
LambdaFunctionHandler = "main.handler"
ApiGatewayName = "HelloLambdaNodejsGateway"