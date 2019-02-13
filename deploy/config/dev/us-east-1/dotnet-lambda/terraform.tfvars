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
        "-var-file=${get_tfvars_dir()}/../../dev.tfvars",
        "-var-file=terraform.tfvars"
      ]
    }
  }
  include = {
    path = "${find_in_parent_folders("terragrunt.tfvars")}"
  }
}

LambdaFunctionName = "HelloLambdaDotNet"
LambdaRuntime = "dotnetcore2.1"
LambdaFunctionHandler = "HelloWorldLambda::HelloWorldLambda.Function::FunctionHandler"
ApiGatewayName = "HelloLambdaDotNetGateway"
