require "open-uri"

if Rails.env.development?
  User.destroy_all
  Group.destroy_all
end

# Seed users
2.times do
  avatar = URI.open("https://picsum.photos/400")
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
  user.avatar.attach(io: avatar, filename: "profile_picture.jpg", content_type: "image/jpg")
  user.save!
end

# Seed groups
4.times do
  picture = URI.open("https://picsum.photos/600")
  group = Group.create(
    name: Faker::Hipster.word,
  )
  group.picture.attach(io: picture, filename: "group_picture.jpg", content_type: "image/jpg")
  group.save!
end
