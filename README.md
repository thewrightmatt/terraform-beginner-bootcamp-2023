# Terraform Beginner Bootcamp 2023

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