This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)



puts "///   Deleting all operations"
Operation.destroy_all
puts "///   Deleting all tags"
Tag.destroy_all
puts "///   Deleting all categories"
Category.destroy_all
puts "///   Deleting all accounts"
Account.destroy_all
puts "///   Deleting all users"
User.destroy_all


puts "///   Creating users"
4.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: Faker::Internet.password(8),
    username: Faker::Name.first_name)
  if user.save
    puts user.username + " created!"
  end
end

puts "///   #{User.count} users in the database!"

puts "///   Creating accounts"
10.times do
  account = Account.new(
    user_id: User.all.sample.id,
    name: "Account Bank #{rand(1..10)}")
  if account.save
    puts account.name + " created!"
  end
end

puts "///   #{Account.count} accounts in the database!"



puts "///   Creating categories"
categorie1 = Category.new(name: "Food", color: "#B4EED5")
if categorie1.save
  puts categorie1.name + " created!"
end
categorie2 = Category.new(name: "Travel", color: "#C6B4EE")
if categorie2.save
  puts categorie2.name + " created!"
end
categorie3 = Category.new(name: "Transports", color: "#B4DCEE")
if categorie3.save
  puts categorie3.name + " created!"
end
categorie4 = Category.new(name: "Telecom", color: "#E2EEB4")
if categorie4.save
  puts categorie4.name + " created!"
end

puts "///   #{Category.count} categories in the database!"



puts "///   Creating tags"
tag1 = Tag.new(name: "Holiday 2017")
if tag1.save
  puts tag1.name + " created!"
end
tag2 = Tag.new(name: "Appart Marais")
if tag2.save
  puts tag2.name + " created!"
end


puts "///   #{Tag.count} tags in the database!"




puts "///   Creating operations"
100.times do
  operation = Operation.new(
    account_id: Account.all.sample.id,
    category_id: Category.all.sample.id,
    title: Faker::Lorem.sentence(2, true, 1),
    amount: rand(10..100),
    date: (Date.today + (rand(10..20)).days),
    approved: false,
    note: Faker::Lorem.sentence(6, true, 2)
    )
  if operation.save
    puts operation.title + " created!"
  end
end

puts "///   #{Operation.count} operations in the database!"
