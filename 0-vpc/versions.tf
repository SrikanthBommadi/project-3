terraform {                           # Start of the Terraform settings block
  required_version = ">= 1.5.0"       # Require Terraform version 1.5.0 or newer

  required_providers {                # Specify required providers for this configuration
    aws = {                           # Define the AWS provider
      source  = "hashicorp/aws"       # Use the official AWS provider from HashiCorp
      version = "~> 6.16.0"           # Accept AWS provider versions >=6.16.0 and <7.0.0
    }
    random = {                        # Define the Random provider
      source  = "hashicorp/random"    # Use the official Random provider from HashiCorp
      version = "~> 3.6.0"            # Accept Random provider versions >=3.6.0 and <4.0.0
    }
  }
}                                     # End of the Terraform settings block