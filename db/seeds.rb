
User.create!([
  name: 'admin',
  email: 'admin@admin.com',
  password: 'admin1234',
  password_confirmation: 'admin1234',
  admin: true
])

5.times do |n|
  User.create!([
    name: 'sample#{n + 1}',
    email: 'sample#{n + 1}@sample.com',
    password: 'sample111#{n + 1}',
    password_confirmation: 'sample111#{n + 1}',
  ])
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
