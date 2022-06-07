require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
article = Article.new(title: "NES", body: "A great console")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

2.times do
  avatar =
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
