# Azure-VM-Terraform-Portainer

Terraform create Azure VM (UbuntuServer) with portainer ready. it also generate SSH key pair for SSH connection to VM.

**NOTES**: Security group is allow all Port, please change after test.

Variables (can be edit in `variables.tf`)

- location: `southeastasias`
- username for ssh connection: `adminuser`

## Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli#install)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)

## Usage

login azure cli

```shell
az login
```

inital terraform project

```shell
terraform init
```

Time to create VM!

```shell
terraform plan -out plan
terraform apply plan
```

Get SSH private key, named "azure.key" then restrict permission.

```shell
terraform output -raw ssh_private_key > azure.key
chmod 600 azure.key
```

wait for about 1 minute for it to setup docker and run portainer.

you can access to server with SSH, to get public IP of VM run `
terraform output -raw public_ip_address` or run below command

```shell
ssh adminuser@$(terraform output -raw public_ip_address) -i azure.key
```

## Clean Up

```shell
terraform plan -destroy -out plan
terraform apply plan
```

## Demonstration

todo
