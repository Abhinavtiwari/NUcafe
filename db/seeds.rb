# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



ItemMenu.destroy_all
OrderSummary.destroy_all
OrderMenu.destroy_all


pictures = [
  { source: "", caption: "Fries" },
  { source: "", caption: "Coke" },
  { source: "", caption: "Cake" },
  { source: "", caption: "Chicken Burger" },
]

pictures.each do |pic|
  p = ItemMenu.new
  p.item_name = pic[:caption]
  p.item_description = pic[:caption]
  p.item_picture = pic[:caption]
  p.item_price = 4.99
  p.item_category = "Grill"
  p.monday = true
  p.tuesday = true
  p.wednesday = true
  p.thursday = true
  p.friday = true
  p.saturday = true
  p.sunday = true
  p.save
end

puts "There are now #{ItemMenu.count} rows in the database."


