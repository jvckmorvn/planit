# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

2.times do
  avatar = Faker
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    avatar: avatar
  )
end

4.times do
  picture =
  Group.create(
    name: Faker::Hipster.word,
    picture: picture
  )
end
