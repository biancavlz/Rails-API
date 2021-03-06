# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |article|
  Article.create!(
    title: "Title #{article}",
    content: "Sed ut perspiciatis unde omnis iste
    natus error sit voluptatem accusantium doloremque
    laudantium, totam rem aperiam, eaque ipsa quae ab
    illo inventore veritatis et quasi architecto beatae
    vitae dicta sunt explicabo.",
    slug: "title-#{article}"
  )
end

puts "Created 3 articles"

user = User.create(
  { login: 'jsmith', name: 'John Smith', provider: 'github' }
)

puts "Created a user"