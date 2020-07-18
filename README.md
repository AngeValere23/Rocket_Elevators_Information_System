# README

## How to connect to the backoffice

You need to connect with a employee account, all default employee are in db/seeds.rb. All the employee have the same default password `rocket`.

## Connect the warehouse

To setup the warehouse you have to edit the `/config/database.yml` and the postgres section.
You can migrate the database via `DB=warehouse rake db:reset db:migrate`, db:reset is not optional

## Seed the warehouse

To take the data from the MySQL database to the warehouse you can use a one line command (yes really :) )
You can use `rake warehouse:seed` be aware that the comment remove EVERYTHING from the warehouse
