# ANTERAZ : Automatisation Open Source dans Azure

Ce repository présente un cas d'automatisation d'Azure via des outils OpenSource.
Il constitue la base de code pour l'article Automatisation Open Source dans Azure.

Cmd d'exécution du playbook pour l'environnement de "dev" : ansible-playbook deploy.yml -e @./vars/dev.yml -e "state=present"