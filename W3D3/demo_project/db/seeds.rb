# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

beach_home = House.create(address: "Newport Beach, California")
mountain_home = House.create(address: "Lake Tahoe, California")

jessica = Person.create(name: "Jessica", house_id: mountain_home.id)
jan = Person.create(name: "Jan", house_id: beach_home.id)
jim = Person.create(name: "Jim", house_id: beach_home.id)