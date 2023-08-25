install:
	ansible-galaxy install -r requirements.yml
encrypt:
	ansible-vault encrypt --ask-vault-pass group_vars/webservers/vault.yml
decrypt:
	ansible-vault decrypt --ask-vault-pass group_vars/webservers/vault.yml
deploy:
	ansible-playbook playbook.yml -i inventory.yml --ask-vault-pass --tags "deploy"
prepare:
	make install & ansible-playbook playbook.yml -i inventory.yml --ask-vault-pass --tags "prepare"
