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
    colour: ["rgba(204,138,186,0.3)", "rgba(177,188,230,0.3)", "rgba(183,229,221,0.3)", "rgba(95,113,97,0.3)", "rgba(152,221,202,0.3)", "rgba(241,222,229,0.3)", "rgba(82,94,117,0.3)", "rgba(191,139,103,0.3)", "rgba(83,87,166,0.3)"].sample
  )
  group.picture.attach(io: picture, filename: "group_picture.jpg", content_type: "image/jpg")
  group.save!
end
