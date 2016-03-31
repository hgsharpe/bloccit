
puts "Seeding database:\n"
puts "Seeding Topics, Posts, Sponsored Posts, Comments, Advertisements, Questions"

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
  topic:  topics.sample,
  title:  RandomData.random_sentence,
  body:   RandomData.random_paragraph
  )
end

# Create one more Topic and Post, unique
unique_topic = Topic.find_or_create_by!(name: 'Celebrities', description: RandomData.random_paragraph)
Post.find_or_create_by!(topic: unique_topic, title: 'Scarlett', body: RandomData.random_paragraph)
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

puts 'Seed finished'
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
