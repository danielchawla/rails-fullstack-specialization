# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

User.create! [
	{username: "Fiorina", password_digest: "1954"},
	{username: "Trump", password_digest: "1946"},
	{username: "Carson", password_digest: "1951"},
	{username: "Clinton", password_digest: "1947"}
]

Profile.destroy_all

Profile.create! [
	{gender: "female", birth_year: "1954", first_name: "Carly", last_name: "Fiorina", user_id: User.first.id},
	{gender: "male", birth_year: "1946", first_name: "Donald", last_name: "Trump", user_id: User.second.id},
	{gender: "male", birth_year: "1951", first_name: "Ben", last_name: "Carson", user_id: User.third.id},
	{gender: "female", birth_year: "1947", first_name: "Hillary", last_name: "Clinton", user_id: User.fourth.id}
]


TodoList.destroy_all

4.times do |i| 
	todo = TodoList.create(list_name: "List #{i}", list_due_date: Date.today >> 12)
	todo.user_id = User.first.id+i
	todo.save
end

TodoItem.destroy_all

20.times do |i|
	item = TodoItem.new
	item.due_date = Date.today >> 12
	item.title = "Item #{i}"
	item.description = "Description #{i}."
	item.todo_list_id = (TodoList.first.id + i/5).to_i
	item.save!
end
