
puts "Seeding database:\n"
puts "Seeding Topics, Posts, Sponsored Posts, Comments, Advertisements, Questions"

# Create Users
5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
 )
end

users = User.all

# Create Topics
10.times do
  Topic.create!(
    name:        RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
  )
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post:  posts.sample,
    body:  RandomData.random_paragraph
  )
end

# Create Sponsored Posts
5.times do
  SponsoredPost.create!(
      topic:  topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
  )
end

# Create Advertisements
10.times do
  Advertisement.create!(
     title: RandomData.random_sentence,
     copy:  RandomData.random_paragraph,
     price: RandomData.random_sponsored_post_price
  )
end

# Create Questions
10.times do
  Question.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    resolved: rand(1..2) == 1
  )
end

user = User.first
user.update_attributes!(
  email: 'youremail.com', # replace this with your personal email
  password: 'helloworld'
 )
 
puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
