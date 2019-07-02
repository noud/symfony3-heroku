#!/usr/bin/env sh
#_project_name=symfony3-heroku
sudo apt-get install php
sudo apt-get install composer

# Symfony 3
composer create-project symfony/framework-standard-edition:^3.0 symfony3-heroku/
cd symfony3-heroku

# Git
git init
git add .
git commit -m "initial import"

echo 'web: heroku-php-apache2 web/' > Procfile
git add Procfile
git commit -m "Heroku Procfile"

# GitHub
git remote add origin https://github.com/noud/symfony3-heroku.git
git push -u origin master

# Heroku
heroku create
heroku config:set SYMFONY_ENV=prod
heroku config:set DATABASE_URL=mysql://root:root@mysql:3306/symfony3-heroku
git push heroku master
heroku open
# Monolog
heroku logs --tail
# Doctrine DBAL
#doctrine.dbal.url: "%env(DATABASE_URL)%"
# Heroku Router
#web/app.php