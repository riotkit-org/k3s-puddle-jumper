all: install deploy

install:
	ansible-galaxy install -r ./requirements.yaml

deploy:
	ansible-playbook ./playbook.yaml -i inventory/hosts.yaml -e force_k3s_upgrade=true
	# --ask-vault-pass
