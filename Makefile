.POSIX:
.PHONY: infra

default: infra config


infra:
	make -C infra

config:
	make -C infra private.pem
	make -C conf

qr:
	ssh -i ./infra/private_ssh_key.pem \
	ubuntu@$(shell cd ./infra && terraform output -raw instance_public_ip) \
	"sudo docker exec wireguard /app/show-peer $(shell cat ./conf/roles/application/tasks/.env | grep "^PEERS" | sed 's/^.*=//; s/,/ /g')"

gen_conf:
	ssh -i ./infra/private_ssh_key.pem \
	ubuntu@$(shell cd ./infra && terraform output -raw instance_public_ip) \
	"sudo cat /etc/wireguard/peer_laptop/peer_laptop.conf" > ~/Desktop/vpn.conf
