# Introduction

RHAAP Configuration as Code : Projet pour INITIALISER rapidement les premiers Objets (Users, Teams, Organizations, Settings, Projets, Inventories, Credentials, Execution Environment) dans RHAAP après une installation.

# Getting Started

## Configurer le Controller

Pour configurer le Controller, il faut préalablement remplir les fichiers dans le dossier '*controller_configs*' de ce projet. Il faut ajouter tous les objets que nous aimerions avoir dès l'initialisation de RHAAP.

Tous les fichiers possibles y existe déjà. Il suffit de commenter le contenu du fichier (surtout le nom de la variable parent qui commence par '*controller_*\*') pour activer ou pas certaines configuration. Au début de tous les fichiers déjà existant, une arborescence des paramètres possibles à été mise en commentaire comme référence rapide. Mais il est toujours mieux de se fier à la [Documentation Officiel infra.controller_configuration](https://galaxy.ansible.com/ui/repo/published/infra/controller_configuration/docs/) en cas de doute. Il y a aussi le Dépôt GitHub qui est très complet : [GitHub Officiel infra.controller_configuration](https://github.com/redhat-cop/controller_configuration).

Le Role 'dispatch' de la Collection '*infra.controller_configuration*' va créer dans le bon ordre tous les objets définis. Il suffit de s'assurer que les objets que l'ont crée et qui utilisent d'autres objets, utilisent des objets qui ont été défini dans cette configuration (et/ou ont été construit préalablement).

### Pour s'aider avec la configuration

Si des objets ont déjà été créer dans RHAAP (par l'UI ou l'API) et que vous souhaitez les ajouter à ce projet d'initialisation, il existe deux méthodes :

1. Il est possible d'exécuter le playbook '**create_filetree_from_controller/filetree_create.yml**' de ce projet. Celà va créer une arborescence de dossiers (par défaut: *"/tmp/filetree_output"*) contenant toutes les informations contenues dans la database. Il sera ensuite possible de copier certaines sections et les ajouter à la configuration du projet actuel.

2. Il est possible d'utiliser l'**API** de RHAAP. Dans un navigateur, aller sur le lien "**https://\<controller name\>/api/v2/**". Mais n'est pas recommander pour la configuration de beaucoup d'objets. L'API visualise les objets en JSON, alors que les fichiers de configuration de ce projet sont en YAML. Il y a une petite conversion à faire, mais à la longue, c'est plus lent.
    - Par exemple : [https://controllerHost.local/api/v2/](https://controllerHost.local/api/v2/)

# Build and Test

## Exécuter la configuration du Controller manuellement

Pour exécuter le playbook, faite la commande suivante :

```bash
cd CaC_InitializeControllerAfterInstall
ansible-playbook configureController.yml --ask-vault-pass
```

## Exécuter la configuration du Controller automatiquement

Il est possible d'exécuter automatiquement la configuration lors de l'installation. Se référer au projet [InstallAAP](https://dev.azure.com/vdq/RHAAP/_git/InstallAAP) pour plus d'informations.
