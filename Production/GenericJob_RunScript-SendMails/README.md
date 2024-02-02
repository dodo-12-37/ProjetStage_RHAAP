# Introduction 
Dépôt pour stocker le Playbook Générique GenericJob_RunScript-SendMails.yml. Ce Playbook sera utilisé par une grande quantité de Workflows pour exécuter un script sur le Host et ensuite avertir du résultat par courriels.

# Getting Started

## Erreur courante

Si tu modifies un fichier directement dans le dossier "*/var/lib/awx/projects/*" qu'utilise RHAAP pour groupenchroniser ses projets, RHAAP ne sera pas capable de groupenchroniser ses projets et les Jobs suivantes seront "**failed**". Le propriétaire du fichier doit être le user "awx" et non "user"... Il faut le corriger avec la commande suivante. Tous les fichiers et dossiers dans "*projects*" seront modifier.

```bash
chown -R awx:awx /var/lib/awx/projects/
```

# Build and Test
Exécuter la commande suivante pour rouler le playbook en local (pas dans *RHAAP*).  
Ensuite, remplir le "survey" pour y donner les bonnes variables.

```bash
cd GenericJob_RunScript-SendMails
ansible-playbook ScriptAndMailInput.yml
```
