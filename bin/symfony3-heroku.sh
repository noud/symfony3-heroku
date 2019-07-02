#!/usr/bin/env sh
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
git push heroku master
heroku open	# browser
# Monolog
heroku logs --tail
#doctrine.dbal.url: "%env(DATABASE_URL)%"
#web/app.php
