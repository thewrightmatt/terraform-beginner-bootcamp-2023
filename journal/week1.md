# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents


## Root Module Structure

Our root module structure will be as follows:

```PROJECT_ROOT
|
├── main.tf           - everything for the most part
├── providers.tf      - defines providers and their configs
├── variables.tf      - stores input vars
├── terraform.tfvars  - data of variables used in variables.tf
├── outputs.tf        - see the outputs
└── README.md         - (Required for root modules)
```


- [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Environment Variables

Terraform Variables Order
- DO: Document the prescendence of varaibles

### Terraform Cloud
In Terraform, we can set either environment variables or Terraform variables.
- TF Vars - Varabiles that would normally bet setin a tfvars file
- ENV Vars - Those that you would set in your Bash termianl such as AWS credentials

TF Cloud variables can be set to be sensitive so they do not appear visibly in the UI.

### Terraform Input Vars
We can use the `-var` flag to set an input varaible or override an existing variable in the tfvars file.

#### Loading Terraform Values
[Terraform Input Varaibles](https://developer.hashicorp.com/terraform/language/values/variables)

##### var-file flag
- TODO: Apparently im supposed to research some shit. Document this flag

##### terraform.tfvars
Default file to load terraform variables

##### auto.tfvars
- TODO: Document this functionality in TF Cloud

### Gitpod