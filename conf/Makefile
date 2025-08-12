.POSIX:

.PHONY: check apply

default: apply

check:
	ansible-playbook -u ubuntu \
					--private-key ../infra/private_ssh_key.pem \
					--check \
					main.yaml 

apply:
	ansible-playbook -u ubuntu \
					--private-key ../infra/private_ssh_key.pem \
					main.yaml