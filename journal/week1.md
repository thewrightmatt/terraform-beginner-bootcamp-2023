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
- `-var 'NAME=VALUE'` - Will set a value for a single input variable declared in the root module of the configuration. Use this option multiple times to set more than one variable. Refer to Input Variables on the Command Line for more information.


- `-var-file=FILENAME` - This set values for potentially many input variables declared in the root module of the configuration, using definitions from a "tfvars" file. Use this option multiple times to include values from more than one file.

##### terraform.tfvars
Default file to load terraform variables

##### auto.tfvars
Files ending in auto.tfvars will automatically get loaded during the plan process

##### Order of Terraform Variables
- Explicit Input Values
- Environment Variables (TF_VAR_*)
- Variable Files (terraform.tfvars, .auto.tfvars)
- Default Values
- Data Sources and Outputs
- Providers and Provider Configuration
- Command-Line Flags (-var, -var-file)
- Workspace Variables (Terraform Workspaces)
- Variable Defaults in Modules

## Dealing with Configuration Drift

### Missing Statefile?
If the statefile is lost, you'll need to destory your cloud infra manually. 

### Fixing Missing Resources with TF Import
`terraform import aws_s3_bucket.website_bucket $S3bucketname`

[Official TF documentation on TF Import](https://developer.hashicorp.com/terraform/cli/import)

### Fix Manual Configuration
If someone deletes or modifies resources in the cloud via 'clickops', we can run `terraform plan` to see what is out of alignment or has 'drifted' from the desired configuration. Subsequently, running a `terraform apply` will then change or potentially redeploy the resource.
