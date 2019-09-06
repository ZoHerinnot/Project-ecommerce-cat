# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
ListCommand.destroy_all
User.destroy_all
Cart.destroy_all

20.times do
 Item.create(
      title: Faker::Creature::Cat.name,
      description: Faker::Quote.matz,
      image_url: Faker::Avatar.image(size: "200x200", format: "jpg", set: "set4", bgset: "bg1"),
      price: rand(5...15)
 )
 puts "#{rand(10)}"
end

u = User.create(email:"google@gmail.com", password:"google@gmail.com").id
u1 = User.create(email:"yahoo@gmail.com", password:"yahoo@gmail.com").id

c = Cart.create(user_id: u)
c1 = Cart.create(user_id: u1)


a = Item.first.id
b = Item.last.id

5.times do
    ListCommand.create( cart:c, item: Item.find(a) )
    ListCommand.create( cart:c1, item: Item.find(b) )
    a+=1
    b-=1
    puts "#{rand(10)}"
end