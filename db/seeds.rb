# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(id: 1, status: 'new')
Status.create(id: 2, status: 'open')
Status.create(id: 3, status: 'on-hold')
Status.create(id: 4, status: 'closed')
