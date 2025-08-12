.POSIX:

default: init apply

init:
	terraform init

apply:
	terraform apply -auto-approve

private.pem:
	terraform plan -out=planfile && \
	terraform show -json planfile | jq --raw-output '.planned_values.outputs.instance_private_key.value' \
	> private_ssh_key.pem
	chmod 600 private_ssh_key.pem

