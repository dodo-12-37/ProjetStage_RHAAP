# Introduction 
Dépôt servant à définir les paramètres nécessaires pour Construire/Publier/Exécuter l'image EE principale pour l'organisation de la Ville De Québec.

# Getting Started
Le fichier '*build-ee.yml*' de se Repos est une modification de celui d'un [formateur Red Hat Greg Sowell](https://github.com/gregsowell/ansible-builder/blob/main/build-ee.yml). J'ai commenté la section qui concerne les Certificats, puisque nous n'en avons pas besoin présentement.

Ce [site](https://developers.redhat.com/articles/2023/05/08/how-create-execution-environments-using-ansible-builder?source=sso) explique comment '*build*, *publish*, *pull*' manuellement. Il est très utile pour faire des modification au fichier principale '*build-ee.yml*'.

Il est important de bien définir les variables suivantes avant d'exécuter le playbook. Ne pas oublier de modifier les *credentials* dans la voute "*credentials.yml*" au besoin.

```bash
vars_files:
  - credentials.yml  # Contient le mot de passe pour déchiffrer le fichier vault

vars:
  # debug: Si 'true', afficher les ansible.builtin.debug
  debug: false

  # aap username/pass
  controller_user: "{{ vault_controller_user }}"
  controller_pass: "{{ vault_controller_password }}"

  # pah username/pass
  pah_user: "{{ vault_pah_user }}"
  pah_pass: "{{ vault_pah_password }}"
  # private automation hub host
  pah_host: privateHubHost.local
  # credential name used in AAP
  pah_cred: Automation Hub Container Registry

  # what is the name of the new EE being built. Repository name should be lowercasse.
  new_ee: vdq_default_ee
  # new version number for the pushed ee
  new_ee_ver: "1.0.0"

  # what is the base EE that is used for building my custom EE
  base_ee: registry.redhat.io/ansible-automation-platform-21/ee-supported-rhel8
  # ee repo
  ee_repo: https://vdq@dev.azure.com/vdq/RHAAP/_git/ManageEE_VDQ
  ee_name_repo: "{{ ee_repo | regex_search('/_git/([A-Za-z0-9_-]+)$') | replace('/_git/', '') }}"

  # what is the path where the EE build files are stored
  path_to_ee_inside_repo: "{{ base_ee_path }}/ansible-execution-environments/{{ new_ee }}"
  # base folder for cloning EE
  base_ee_path: "{{ playbook_directory }}"

  # garbage_collection: Permet de supprimer toutes les images présentes en local si 'true'
  garbage_collection: true
```

# Build and Test

L'exécution de la commande peut être assez long. Soyez patient.

Commande d'exécution :

```bash
ansible-playbook build-ee.yml --ask-vault-pass
```
