# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents

## Git Tags
- [How To Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

**Locally Delete Tag**

`git tag -d <tag_name>`


**Delete Remote Tag**

`git push --delete origin tagname`


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

## Terraform Modules

### Terraform Module Structure
A module should at least contain `modules` directory when locally developing modules.

### Passing Input Variables
We can pass input varaibles to our module. The module needs to declare the varaibles in it's own variables.tf
```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Module Sources
We can source/import modules from different locations:
- locally
- Github
- TF registry

## ChatGPT
The training data the LLMs such as ChatGPT use may not be the latest; such an example would be ChatGPT not providing any new data beyond 2021 in regards to Terraform.

## Working with files in Terraform

### Heredoc
- Terraform also supports a "heredoc" style of string literal inspired by Unix shell languages, which allows multi-line strings to be expressed more clearly.
- [Source](https://developer.hashicorp.com/terraform/language/expressions/strings#indented-heredocs)

### Filexists Function
This is a built in terraform function to check the existance of a file
```tf
condition = fileexists(var.index_html_filepath)
```

### Filemd5
- [Source](https://developer.hashicorp.com/terraform/language/functions/filemd5)
- Used to get the checksum of a file, used in the S3 document upload to check for file changes.

### JSONEncode
- [Source](https://developer.hashicorp.com/terraform/language/functions/jsonencode)
- `jsonencode` encodes a given value to a string using JSON syntax. Good for inline policies

### Path Variable
There is a special varaible called `path` in Terraform that allows one to reference local paths:
- path.module = Filesystem path of the module where the expression is placed.
- path.root = The filesystem path of the root module of the configuration.
- path.cwd = This path is an absolute path that includes details about the filesystem structure. 
- [Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

#### Path Var Example

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath

  etag = filemd5(var.index_html_filepath)
}
```

### Terraform Data
Different than sources, `terraform_data` allows for resource lifecycle. You can use the `terraform_data` resource without requiring or configuring a provider. Source and examples below

- [Source](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

### Terraform Data Sources
This allows us to source data from cloud resources. It's useful to reference cloud resources without importing them
- [TF Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

```tf
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

### Changing the lifecycle of resources
- [Source](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)
- Lifecycle is a nested block that can appear within a resource block. The lifecycle block and its contents are meta-arguments, available for all resource blocks regardless of type.

## Provisioners
- Provisioners allow you to execute commands on compute resources for actions that aren't natively supported via Terraform (aka configuration)
  - Not recommended by Hashicorp due to it being configuration rather than infrastructure provisioning.

### Local-exec
- A command will be executeded on the machine running the terraform commands, eg. plan/apply

```tf
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
```

### Remote-exec
This will run commands on a remote machine (not jthe one running Terraform). Creds for either SSH or other will need to be provided.

```tf
provisioner "remote-exec" {
  inline = [
    "puppet apply",
    "consul join ${aws_instance.web.private_ip}",
  ]
}
```

## For Each Expresisons
- For each allows enumeration over complex data types. It is useful for multiples of a cloud resource and for implementing DRY.
```sh
[for s in var.list : upper(s)]
```
- [For Each Expression](https://developer.hashicorp.com/terraform/language/expressions/for)