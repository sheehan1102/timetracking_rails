# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Running seed file..."

Project.destroy_all
Entry.destroy_all

puts "All projects destroyed."

(1..5).each do |i|
	Project.create!(
		title: "Ironhack number #{i}",
		priority: rand(1..3),
		description: "This is the description for #{i}"
	)
	Project.create!(
		title: "Personal number #{i}",
		priority: rand(1..3)
	)
end

puts "New projects created"

Project.all.each do |p|
	(1..5).each do |i|
		p.entries.create(hours: i, minutes: 35, date: Date.today)
	end
end

puts "New entries created"