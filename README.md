# ENSIIE'Colloc

ENSIIE'Colloc est un site web permettant de proposer ou rechercher une collocation. Ce site web à été réalisé dans le cadre d'un projet d'étude à [l'ENSIIE.](http://www.ensiie.fr)

# Prérequis
Afin de pouvoir fonctionner, le site web nécessite les ressources suivantes :
  * Ruby ( >= 2.1.0) [Documentation](https://www.ruby-lang.org/fr/documentation/installation/)
  * PostgreSQL [Documentation](http://doc.ubuntu-fr.org/postgresql)
  * Un compte Amazon S3 [Documentation](https://aws.amazon.com/fr/s3/)

# Installation
> Pour cette installation nous nous baserons sur un environement Ubuntu 14.04 avec PostgreSQL installé et configuré.
> La procédure suivante permet uniquement le lancement de l'application en mode developpement.

## Installation des dépendances

Afin d'installer les dépendance de l'application, il suffit de lancer bundler :
```
bundle install
```

Il se peut que l'installation échoue en renvoyant un message d'erreur ressemblant à :
> Can't install RMagick 2.13.1. Can't find Magick-config

Il faut installer le packet magick-wand :
```
sudo apt-get install libmagickwand-dev
```
Et relancer
```
bundle install
```

## Configuration de la base de données
Afin de configurer la base de données veuillez renseigner vos identifiants dans le fichier config/database.yml

```
development:
  <<: *default
  database: <DB NAME>
  username: <DB USER>
  password: <DB PASS>
```

Puis lancer la mise en place d'une base de donnée de base :

```
rake db:setup
```

## ENJOY !

Voila votre site web est prêt il ne reste plus qu'à le lancer avec :
```
rails s
```

### Connection
Par défaut la base de donnée contient 6 utilisateurs et 6 collocations. Pour vous connecter en temps qu'admin, utilisez les identifiants suivants :
```
User : admin@admin.adm
Pass : adminadmin
```

La liste des autres utilisateurs est disponible dans le fichier config/db/seeds.rb

# Divers
## Mailgun
L'envoi de mail est géré par mailgun pour le lier à votre compte, éditez le fichier config/environments/development.rb à la ligne 38 :
```
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
config.action_mailer.delivery_method = :mailgun
config.action_mailer.mailgun_settings = {
        api_key: 'key-bbcbb45d6e83baa6b46e0579576dba77',
        domain: 'sandboxb2077991547f4fde8252b9c30490d134.mailgun.org'
}
```

## AWS
En dévelopement le site stocke les fichiers en local. En production il utilise Amazon Web Services.
Pour personnaliser ces paramètres modifiez le fichier config/initializers/carrierwave.rb

# Disclaimer

Site réalisé par CHICOIS Maxime et HURTER Jonathan pour un projet d'étude au sein de [l'ENSIIE.](http://www.ensiie.fr)
