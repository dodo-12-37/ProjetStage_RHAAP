# Introduction 
Repos servant à stocker le fichier d'inventaire servant pour l'installation de AAP.

# Getting Started

## Configurer le fichier d'inventaire "*inventory*"
  
Le fichier présent dans ce Repos est la configuration utilisé actuellement. Il existe plusieurs étape dans la configuration. Certaines sont obligatoires, d'autres fortement recommandé, et d'autres inutiles pour nos besoins actuels.

- Obligatoires :
  - Configurer le **Controller**
  - Configurer le **Private Automation Hub** (*PAH*)
  - Configurer la **Database Postgres pour Controller**
  - Configurer la **Database Postgres pour PAH**
  - Configurer le **Hub registry** (*pour que le Controller puisse récupérer les images EE*)
- Recommandés :
  - LDAP pour PAH
  - Configuration Automatique Post Installation du Controller (Organizations, Teams, Users, Projets, Inventories, Credentials, Settings Ex: LDAP)
- Inutiles :
  - Configurer le **Automation EDA Controller** (*Event-Driven Ansible*)
- Inconnus :
  - Single taskn-On (SSO)

## Configurer le fichier de Voute "*credentials.yml*"

Ne pas oublier de mettre à jour les mots de passes contenu dans le fichier de Voute !

## Le dossier "*controller_license_file*"

Le dossier "*controller_license_file*" permet d'utiliser l'initialisation Post-Installation automatique. Le projet [CaC_InitializeControllerAfterInstall](https://dev.azure.com/vdq/RHAAP/_git/CaC_InitializeControllerAfterInstall) sera utilisé pour l'initialisation. **Il peut être une bonne idée de le mettre à jour avant de démarrer l'installation.** Il faut également changer certaines valeurs dans le fichier de Voute "*credentials.yml*"

Il est également recommandé de s'assurer que le Manifest de Licence RHAAP soit à jour. [Voir le fichier d'explication ici présent](./controller_license_file/README.md).

# Build and Test

## Commandes pour exécuter le script d'installation

1. Déterminer le dossier contenant les fichiers d'installations :

    ```bash
    path/to/ansible-automation-platform-setup-<latest-version>

    # Dans notre cas actuellement :
    /home/ansible-automation-platform-setup-2.4-3
    ```

2. Il existe deux façons de faire la copie des fichiers :

    1. Manuellement :

        Déposé le fichier d'inventaire "**inventory**", le fichier Voute "**credentials.yml**" et le dossier "**controller_license_file**" dans le dossier d'installation de l'[étape 1](#commandes-pour-exécuter-le-script-dinstallation).

        ```bash
        cd /home/AzureRepos/InstallAAP

        cp ./inventory /home/ansible-automation-platform-setup-2.4-3/.
        cp ./credentials.yml /home/ansible-automation-platform-setup-2.4-3/.
        cp -dr ./controller_license_file /home/ansible-automation-platform-setup-2.4-3/.
        ```
  
    2. Ou avec un playbook :

        Déposer les mêmes fichiers en exécutant le playbook "*copyFilesForSetup.yml*".

        ```bash
        cd /home/AzureRepos/InstallAAP

        ansible-playbook copyFilesForSetup.yml
        ```

3. Ensuite, exécuter le script 'setup.sh' avec la commande suivante :

    ```bash
    cd /home/ansible-automation-platform-setup-2.4-3

    ./setup.sh -e @credentials.yml -- --user ansible --become-user user --become --ask-vault-pass
    ```

    L'installation va démarrer. Cela va être long. Il suffit d'être patient.

> **ERREUR POSSIBLE:** Il se peut que le "*controllerHost.local*" se désabonne tout seul de *Satellite* lors d'une réinstallation, ou qu'il s'abonnne mal lors de l'installation... *Je n'ai pas trouvé d'ou provenait cette erreur pour le moment...* Suivre la [procédure de réinscription à Satellite](./Procédure_Inscription_Satellite/Procédure_Inscription_Satellite.md) du "*controllerHost*".
