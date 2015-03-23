# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Initiative.create name: "Email Park", start_date: Time.now, description: "Some description text\n\nNewlines etc"
Initiative.create name: "Work-First", start_date: 3.weeks.from_now, description: "Making work, first, obviously."