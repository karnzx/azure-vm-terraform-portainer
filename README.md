# Azure-VM-Terraform-Portainer

Terraform create Azure VM (UbuntuServer) with portainer ready. it also generate SSH key pair for SSH connection to VM.
with docker-compose's example (portainer stack) of palworld, minecraft game.
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

Access Portainer at `https://<Public_IP>:9443`, Port 9443

```shell
echo "https://$(terraform output -raw public_ip_address):9443"
```

there example to deploy game server "Palworld" and "Minecraft" in `example-portainer-stacks`. copy and Add `stack` into portainer.

[Palworld dedicated server ด้วย Docker เล่นกับเดอะแก๊งสูงสุด 32 คน](https://piravit-chenpittaya.medium.com/palworld-dedicated-server-%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2-docker-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%94%E0%B8%AD%E0%B8%B0%E0%B9%81%E0%B8%81%E0%B9%8A%E0%B8%87%E0%B8%AA%E0%B8%B9%E0%B8%87%E0%B8%AA%E0%B8%B8%E0%B8%94-32-%E0%B8%84%E0%B8%99-961bc3d22909)

## Clean Up

```shell
terraform plan -destroy -out plan
terraform apply plan
```

## Demonstration

<https://github.com/karnzx/azure-vm-terraform-portainer/assets/26167071/2dc7b3a8-dd0d-4576-9f1c-f582dbc087d4>
