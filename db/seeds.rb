#Category

Category.destroy_all

category_list = [
  {name: "Chinese"},
  {name: "Japanese"},
  {name: "Italian"},
  {name: "Mexican"},
  {name: "Vegetarian"},
  {name: "American"},
  {name: "Fusion"}
]

category_list.each do |category|
  Category.create(name: category[:name])
end

puts "Category created"

#Default admin

User.create(email: "anna770822@gmail.com", password:"123456", role: "admin", name:"root")

puts "Default admin created"