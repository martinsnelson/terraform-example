# The terraform {} block contains Terraform settings, including the required providers 
# Terraform will use to provision your infrastructure. For each provider, the source attribute 
# defines an optional hostname, a namespace, and the provider type. Terraform installs providers 
# from the Terraform Registry by default. In this example configuration, the aws provider's source 
# is defined as hashicorp/aws, which is shorthand for registry.terraform.io/hashicorp/aws.
terraform {
  #   backend remote  and the Set up Terraform Cloud
  # backend "remote" {
  #   oorganization = "hashicorp-learn"
  #   workspaces {
  #     name = "Example-Workspace"
  #   }
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
  #   Você também pode definir uma restrição de versão para cada provider no example: "required_version" is optional
  required_version = ">= 1.2.0"
}

# The provider block configures the specified provider, in this case aws. A provider is a plugin that Terraform uses to create and manage your resources.
provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}

# The resource, resource blocks to define components of your infrastructure. A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application.
# Resource blocks have two strings before the block: the resource type and the resource name. In this example, the resource type is aws_instance and the name is app_server. The prefix of the type maps to the name of the provider.
# The terraform manages the aws_instance resource with the aws provider. Together, the resource type and resource name form a unique ID for the resource. For example, 
# the ID for your EC2 instance is aws_instance.app_server. 
# Resource blocks contain arguments which you use to configure the resource. 
# Arguments can include things like machine sizes, disk image names, or VPC IDs. 
# Our providers reference lists the required and optional arguments for each resource. For your EC2 instance, the example configuration sets the AMI ID to an Ubuntu image, and the instance type to t2.micro, which qualifies for AWS' free tier. It also sets a tag to give the instance a name.
resource "aws_instance" "app_server" {
  # ubuntu22.04LTS-64x86 ->ami-04b3c23ec8efcc2d6
  # awsLinux2k5.10-64x86 ->ami-0895310529c333a0c
  ami           = "ami-0895310529c333a0c"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.instance_name
  }
}

# terraform init
# terraform fmt
# terraform apply
# terraform show
# terraform destroy


# Fy;
# Initialize the directory
# Terraform downloads the aws provider and installs it in a hidden subdirectory of your current 
# working directory, named .terraform. The terraform init command prints out which version of 
# the provider was installed. Terraform also creates a lock file named .terraform.lock.hcl which 
# specifies the exact provider versions used, so that you can control when you want to update 
# the providers used for your project.

# Tip: If your configuration fails to apply, you may have customized your region or removed your default VPC.

# Create infrastructure
# Apply the configuration now with the "terraform apply" command.

# Inspect state
# When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. 
# Terraform stores the IDs and properties of the resources it manages in this file, so that it can 
# update or destroy those resources going forward.  
# The Terraform state file is the only way Terraform can track which resources it manages, 
# and often contains sensitive information, so you must store your state file securely and restrict 
# access to only trusted team members who need to manage your infrastructure. In production, 
# we recommend storing your state remotely with Terraform Cloud or Terraform Enterprise. 
# Terraform also supports several other remote backends you can use to store and manage your state. 

# Manually Managing State