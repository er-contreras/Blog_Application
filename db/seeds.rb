# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# <--------------- Create Users --------------->
5.times do
  User.create(name: Faker::Name.name, photo: Faker::File.file_name(dir: 'path/to'), bio: Faker::Lorem.paragraphs)
end

# <------------------- Posts for User 1 ------------>
5.times do
  Post.create(user_id: 1, title: Faker::Book.title, text: Faker::Quote.matz)
end

# <------------------- Posts for User 2 ------------>
5.times do
  Post.create(user_id: 2, title: Faker::Book.title, text: Faker::Quote.matz)
end

# <------------------- Comments and likes for User 1 ------------>
5.times do
  Comment.create(user_id: 1, post_id: 5, text: Faker::Lorem.question)
end

5.times do
  Like.create(user_id: 1, post_id: 5)
end

5.times do
  Comment.create(user_id: 1, post_id: 4, text: Faker::Lorem.question)
end

5.times do
  Like.create(user_id: 1, post_id: 4)
end

# <------------------- Comments and likes for User 2 ------------>
5.times do
  Comment.create(user_id: 2, post_id: 10, text: Faker::Lorem.question)
end

5.times do
  Like.create(user_id: 2, post_id: 10)
end

5.times do
  Comment.create(user_id: 2, post_id: 9, text: Faker::Lorem.question)
end

5.times do
  Like.create(user_id: 2, post_id: 9)
end
