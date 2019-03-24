# Heroes API

## Description

This is a restful API that mantains heroes and their universe. You can perform the basic rest actions, to create, update, delete or view. You can also associate heroes to their respective universe.

## Due date
  March 25, 2019

## Technologies and versions

* Rails(5.2.2.1)
* Ruby(2.6.1)
* PostgreSQL v11.2 or greater
* Rspec v3.8
* Rubocop v0.66.0

## Installation Process

### Define ruby gemset

If using RVM, be sure to set up your gemset:
Do this on the root of the project.

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

  `$ rails db:seed` (If you want dummy seeds in your local database)

### Generating documentation

  `$ yardoc app/controllers/concerns app/controllers application_controller.rb app/controllers/api/v1/errors_controller.rb`

### Testing
Ensure everything is fine and there're no errors

  `$ rspec` (Unit tests check)

  `$ rubocop` (Linter check)
