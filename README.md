# Infrastructure

This repo contains terraform scripts to roll out AWS infrastructure to deploy sample app.

## Steps:
 * Install Terraform CLI from [here](https://developer.hashicorp.com/terraform/downloads)
 * Rename `terraform.example.tfvars` to `terraform.tfvars` and provide credentials.
 * Run `terraform init` then `terraform apply`.

To see private key, use: 
 `terraform output private_key`

To avoid confirmation prompt, use:
`terraform apply -auto-approve`

To destroy everything, use:
`terraform destroy`
