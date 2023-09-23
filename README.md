# Terraform Beginner Bootcamp 2023

## Table of Contents
- [Semantic Versioning](#semantic-versioning-mage)
- [Install the Terraform CLI](#install-the-terraform-cli)



## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging. [semver.org](https://semver.org)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
Changed due to keyring changes and had to refer to the official Terraform docs for Linux installs.
[Install Terraform CLI] (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


### Refactored into Bash Script
Recreated the Terraform CLI installation script with a shell script in /bin/ and change init to before in the .gitpod.yml files.

### Considerations for Linux Distribution
Had to check the OS version used in GitPod to install Terraform via 
```/etc/os-release/```

#### GitPod Init
[GitPod Link](https://www.gitpod.io/docs/configure/workspaces/tasks) for understanding how .gitpod.yml should function properly

### Working with Env Vars
We can list out all environmental variables using the `env` command and use `grep` to understand.
- We can set set a variable using `export PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023`
- We and remove that variable using `unset PROJECT_ROOT` to remove the variable

#### Env Var Persistence
- Use `gp env PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'` to set a variable as persistent using gitpod

### AWS CLI Installation
- [Documentation on setting env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

AWS CLI is installed for the project via the bash script `bin/install_aws_cli`

We can check if your AWS creds are configured correctly using the following command:
```sh
aws sts get-caller-identity
```

## Terraform Basics

### Terraform Registry
Terraform sources their providers and modules from the TF registry located [here](https://registry.terraform.io/)

- **Providers** is an interface to APIs to create resources
- **Modules** are a way to make large amounts of TF code modular and portable 

### Terraform Init
Initializes a directory and pulls down the provider binary

### Terraform Output
Can use `terraform output` to see what resources can be output

### Terraform Apply
Run `terraform apply --auto-approve` to automatically apply without a prompt

### Terraform Destroy
This will destroy resources, needs approval and can be auto-approved via `terraform destory --auto-approve`

### Terraform State File
`.terraform.tfstate` contains the current state of the infrastructure. **Don't commit**

## Terraform State Migration
Migrated the state to TF cloud using `terraform login` and then following the prompts. Required manual click on the link to generate a token and then paste it.