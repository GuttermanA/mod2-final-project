# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c = Category.create(name: 'Famous Cats')

Choice.create(name: 'Garfield', content: 'Fat Cat', img_url: "https://imgur.com/TVGun10.jpg", category: c )
Choice.create(name: 'Felix the Cat', content: '100-Year-Old Silent Cat', img_url: "https://imgur.com/P6EzsP8.jpg", category: c )
Choice.create(name: 'Hello Kitty', content: 'Japanese Phenomenon', img_url: "https://imgur.com/ImIN8rX.jpg", category: c )
Choice.create(name: 'Sylvester', content: 'Chasing Tweety Bird', img_url: "https://imgur.com/8obTp9H.jpg", category: c )
Choice.create(name: 'Simba', content: "Just Can't Wait To Be King", img_url: "https://imgur.com/150vdMo.jpg", category: c )
Choice.create(name: 'Cat in the Hat', content: 'Vandalizes Your House', img_url: "https://imgur.com/SOXhkBB.jpg", category: c )
Choice.create(name: 'Lucifer', content: 'Devilish, Antagonized Cat in Cinderella', img_url: "https://imgur.com/cQQQlnn.jpg", category: c )
Choice.create(name: 'Grumpy Cat', content: 'Grouchy Grouch', img_url: "https://imgur.com/O4PO79G.jpg", category: c )
Choice.create(name: 'Cheshire Cat', content: 'Mischievous Grin and Amusing Dialogue.', img_url: "https://imgur.com/QdFw3cT.jpg", category: c )
Choice.create(name: 'Pink Panther', content: 'Dead ants', img_url: "https://imgur.com/3aBPKpj.jpg", category: c )
Choice.create(name: 'Puss in Boots', content: 'The Shrek Cat', img_url: "https://imgur.com/TejyxxR.jpg", category: c )

Choice.all.each do |choice|
  choice.category = Category.first
  choice.save
end

10.times do
  q = Question.generate_new(category: Category.first)
  q.save
end
