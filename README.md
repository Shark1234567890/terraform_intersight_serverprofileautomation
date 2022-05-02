# Infrastructure as Code: Managing Cisco UCS in Intersight via Terraform

Terraform script to (1) create policies and pools in Intersight, (2) create a template and associate policies and pools to it, and (3) derive profiles from the template.

#### Contact: Jara Osterfeld (josterfe@cisco.com)

## Solution Components
* Intersight 
* Terraform, based on [Intersight Provider](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest)
* Python


## Installation

1. Clone this repository with `git clone <this repo>`.
2. Navigate to the root of the directory and take the following actions: 
    - Add the `SecretKey.txt` file from the Intersight API key to the directory.
    - Open the `terraform.tfvars` file and add the values for the defined variables. A description of each variable can be found in the `variables.tf` file. 

3. Run `terraform apply`.


### Deriving server profiles from server template
Server profiles that are derived from the server templates are created using the [Intersight API](https://intersight.com/apidocs/apirefs/bulk/MoCloners/model/) and Python since there is no Terraform module for it yet (see [GitHub issue #151](https://github.com/CiscoDevNet/terraform-provider-intersight/issues/151)). As a result, the server profiles are not part of the Terraform state file, which means amongst others that it will not be destroyed when running `terraform destroy`.