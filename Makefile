install:
	ansible-galaxy install -r requirements.yml
encrypt:
	ansible-vault encrypt --vault-password-file vault-password group_vars/webservers/vault.yml
decrypt:
	ansible-vault decrypt --vault-password-file vault-password group_vars/webservers/vault.yml
deploy2:
	ansible-playbook playbook.yml -i inventory.yml --vault-password-file vault-password --tags "deploy"
deploy:
	ansible-playbook playbook.yml -i inventory.yml --tags "deploy"
prepare:
	make install & ansible-playbook playbook.yml -i inventory.yml --tags "prepare"
