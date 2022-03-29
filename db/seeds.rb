#adminユーザー
User.create!([
  name: "admin",
  email: "admin@admin.com",
  password: "admin1234",
  admin: true
])
#sampleユーザー
4.times do |i|
  User.create!([
    name: "sample#{i + 1}",
    email: "sample#{i + 1}@sample.com",
    password: "sample1234",
    admin: false
  ])
end
#sampleジャンル
Genre.create!([
  {name: "バトル" },
  {name: "ギャグ" },
  {name: "恋愛" }
])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
