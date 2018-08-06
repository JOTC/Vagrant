#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
[ -s "/home/vagrant/.nvm/nvm.sh" ] && . "/home/vagrant/.nvm/nvm.sh"  # This loads nvm

nvm install v0.12
nvm alias default 0.12

npm install -g npm@3.x-latest

# Add a dev user; username is "dev", password is "password"
mongo jotc --eval 'db.users.insert({
  "_id": ObjectId("5500e839c49d40165240fcd1"),
  "local": {
    "username": "dev",
    "secret": "$2a$10$GPG29JlCC0SYTq/fzhJTPut2Y0jU1rmYcxvegLrtNHzmLGHqBVQB6"
  },
  "name": "Dev User",
  "email": "jotcwebsite@gmail.com",
  "permissions": {
    "links": true,
    "officers": true,
    "shows": true,
    "classes": true,
    "pictures": true,
    "calendar": true,
    "users": true,
    "payments": true
  }
})'