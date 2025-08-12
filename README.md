# Selfhost VPN

Selfhost your VPN using Wireguard.

## Prerequisites

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) and [Terraform](https://developer.hashicorp.com/terraform/install) are required to run the project.
- Oracle Cloud account.
- Create API key from user setting of your Oracle Cloud account, save the private key and finally create the config file at `~/.oci/config` following its instruction.

Configuration file has the following format:

```text
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaazpwmxxx
fingerprint=e7:32:90:c1:f7:d0:a4:xx:xx:xx:x:xx:xx:xx:xx:xx
tenancy=ocid1.tenancy.oc1..aaaaaaaajkaketxrpa45qrr7iqa6c4rushriv3xxx
region=eu-frankfurt-1
key_file=<path to your private keyfile>
```

- Configure terraform backend of your choice at `/infra/terraform.tf`. Personally I use HCP Terraform to save the state.
- Create `.env` file at `/conf/roles/application/tasks` as a place to store environment variables.
- Create `terraform.tfvars` file at `/infra` and fill your info as below. These variables are sensitive information and necessary to configure `oci` provider. If HCP Terraform is used, we can create and set the value of these variables there.

```text
tenancy_ocid = "ocid1.tenancy.oc1..aabbxx"
user_ocid    = "ocid1.user.oc1..aabbxx"
fingerprint  = "aa:aa:xx:xx:xx"
private_key = "privatekeycontent"
region = "eu-frankfurt-1"

compartment_id = "ocid1.tenancy.oc1..aabbxx"
```

> [!TIP]
> It is recommended that you upgrade the Oracle Cloud account to Pay-as-you-go so
> you'd have no trouble/constraint when create "A1 Flex" VM type, and it should remain free as long as you configure the resources following the always free tier policies.

## Usage

- At root directory, run command:

`make`: run terraform to create infrastructure first, then ansible playbook to install softwares.

`make qr`: generate QR code for each available peer.

`make gen_conf`: output the configurations to a file for importing to Wireguard client.
