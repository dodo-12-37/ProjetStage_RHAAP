# Utiliser "**Postinstall**"

Référence officiel : https://www.ansible.com/blog/seeding-ansible-automation-platform-content-at-installation-time

## Utilisation

Le texte suivant provient de la documentation officiel :

> By default, postinstall is disabled so we have to set '**controller_postinstall**=true'.

> The content seeding is done via a collection which uses the API to access automation controller. To use that, we need a valid subscription applied, hence the use of the **controller_license_file**. This is a manifest file generated on the RHN portal as documented here available as a .zip file and requires local filegroupestem access. This means you won’t need to accept or input a subscription on first logging into the platform.

> **controller_postinstall_repo_url** sets the source for the configuration-as-code files. This is essentially a Git-based repository which contains the necessary .yml files we’ll load in.

> **controller_postinstall_dir** is the local filegroupestem location where we’ll Git clone the repository content into.

> To use the postinstall feature you need to set these variables in the "*inventory*" file :

Pour se connecter à *AzureVDQ*, ne pas oublier de définir le *Personal Access Tokens* "**vault_password_azureVDQ__RHAAP_NomUtilisateur**" de l'utilisateur principal  dans le fichier de voute "**credentials.yml**".

```ini
controller_postinstall='true'
controller_license_file='controller_license_file/file.zip'
controller_postinstall_repo_url = 'https://vdq:{{ vault_password_azureVDQ__RHAAP_User2 }}@dev.azure.com/vdq/RHAAP/_git/CaC_InitializeControllerAfterInstall'
controller_postinstall_dir='/tmp/RHAAP-PostInstall/'
```

## Trouver le Manifest

1. Tout d'abord, il faut se connecter au [Red Hat Hybrid Cloud Console](https://console.redhat.com/subscriptions/manifests).

2. Dans le menu à gauche, cliqué sur *Manifest*. Puis télécharger le Manifest '*satelliteHost*' (ou celui qui contient les Subscriptions de *Red Hat Ansible Automation Platform*).

3. Déposé le fichier '.zip' dans le dossier de votre choix sur le Controller Host. Ajuster le chemin vers le fichier pour la variable **controller_license_file** du fichier inventory.
