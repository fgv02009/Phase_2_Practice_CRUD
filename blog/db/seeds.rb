User.create(username: "fgv02009", password_hash: BCrypt::Password.create("password"))
10.times do
  User.create(username: Faker::Commerce.color, password_hash: BCrypt::Password.create("password"))
end

users = User.all
users.each do |user|
  Blog.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user: user)
  Blog.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user: user)
  Blog.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user: user)
end

blogs = Blog.all
50.times do
  Tag.create(word: Faker::Lorem.word)
end

tags = Tag.all

tags.each do |tag|
  Connection.create(blog: blogs.sample, tag: tag)
  Connection.create(blog: blogs.sample, tag: tag)
end
