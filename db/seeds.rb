# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(first_name: "Tester",
                last_name: "McUser",
                email: "user@example.com",
                password: "password")
user.save!

1.upto(5) do |n|
  Task.create!(user: user, description: Faker::Lorem.paragraph, position: n)
end
