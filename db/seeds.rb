# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting all stories and comments"
Story.destroy_all
Comment.destroy_all
puts "done"

10.times do
  story = Story.new(
    name: Faker::Games::StreetFighter.character,
    text: Faker::Game.title,
    image_url: "https://picsum.photos/200/300"
  )
  story.save
  rand(5).times do
    comment = Comment.new(
      name: Faker::Games::SuperMario.character,
      content: Faker::Movies::Lebowski.quote,
      story_id: story.id
  )
  comment.save
  end
end

puts "created #{Story.count} stories and #{Comment.count} comments."
