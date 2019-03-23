# Heroes API

## Description

This is a restful API that mantains heroes and their current universe.

## Due date
  March 25, 2019

## Technologies and versions

* Rails(5.2.2.1)
* Ruby(2.6.1)
* PostgreSQL v11.2 or greater

## Installation Process

### Define ruby gemset

If using RVM, be sure to set up your gemset:

  `$ cd heroes-api`

  `$ echo "heroes-api" > .ruby-gemset`

  `$ cd ..`

  `$ cd heroes-api`

### Installing dependencies

  `$ gem install bundler`

  `$ bundle install`

### Creating the database

- Run
  `$ cp config/database.template.yml config/database.yml`
- Edit the database.yml to specify your specific database username/password if needed.
- Run
  `$ rails db:create`

  `$ rails db:migrate`
