To deploy infrastructure with Terraform:

Scope - Identify the infrastructure for your project.
Author - Write the configuration for your infrastructure.
Initialize - Install the plugins Terraform needs to manage the infrastructure.
Plan - Preview the changes Terraform will make to match your configuration.
Apply - Make the planned changes.

<!-- In the "Terminal" tab, initialize the project, which downloads a plugin that allows Terraform to interact with Docker. -->
terraform init

<!-- We recommend using consistent formatting in all of your configuration files. The terraform fmt command automatically updates configurations in the current directory for readability and consistency.  Format your configuration. Terraform will print out the names of the files it modified, if any. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names. -->
terraform fmt

<!--Provision resources, terraform asks you to confirm, type yes and press ENTER. -->
terraform apply

<!-- Inspect the infrastructure current state using -->
terraform show

<!-- Use command terraform state with subcommand list to list of the resources in your project's state. -->
terraform state list

<!-- Terraform prints output values to the screen when you apply your configuration. Query the outputs with the terraform output command. -->
terraform output

<!-- Destroy resources -->
terraform destroy

# Terraform Cloud steps
<!-- Login to Terraform Cloud steps -->
terraform login

<!-- Now that you have configured your Terraform Cloud integration -->
terraform init

<!-- Now that Terraform has migrated the state file to Terraform Cloud, delete the local state file. -->
rm terraform.tfstate

# Set workspace variables
<!-- Set workspace variables -->
created the "learn-tfc-aws" workspace in your Terraform Cloud organization

go to the workspace's Variables page. Under Workspace Variables, add your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as Environment Variables

terraform apply