require 'active_record'
require './lib/dessert'
require './lib/entree'
require './lib/meal'
require 'pry'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
	puts "Welcome to Meal Organizer!!!"
	puts "Put 'e' to add an entree"
	puts "Put 'z' to delete an entree"
	puts "Put 'l' to see menu of food options"
	puts "Put 'd' to add a dessert"
	puts "Put 'o' to delete a dessert"
	puts "Put 'r' to rate a dessert"
	puts "Put 'm' to create a meal"
	# puts "Put 'v' to all created meal plans"
	puts "Put 'x' to exit meal organizer"

	choice =gets.chomp

	if choice == 'e'
		add_entree
	elsif choice == 'z'
		delete_entree
	elsif choice == 'd'
		add_dessert
	elsif choice == 'o'
		delete_dessert
	elsif choice == 'r'
		rate_dessert
	elsif choice == 'm'
		create_meal
	elsif choice == 'l'
		view_menu
	# elsif choice == 'v'
	# 	view_meal
	elsif choice == 'x' 
		puts "Goodbye!!!"
		exit
	else 
		puts "Validity is what you seek. Try again."
	end

end

def add_entree
	puts "What entree would you like to add?"
	choice = gets.chomp
	new_entree = Entree.create({:name => choice})
	welcome
end

def delete_entree
	puts "Here are all your entrees:"
	entrees = Entree.all
	entrees.each{|entree| puts entree.name}
	puts "Which entree would you like to delete?"
	bad_entree = gets.chomp
	deleted_entree = Entree.where({:name => bad_entree}).first
	deleted_entree.delete
	welcome
end

def add_dessert
	puts "What dessert would you like to add?"
	dessert_name = gets.chomp
	new_dessert = Dessert.create({:name => dessert_name})
	welcome
end

def delete_dessert
	puts "Here are all your desserts:"
	desserts = Dessert.all
	desserts.each {|dessert| puts dessert.name}
	puts "Which dessert would you like to delete?"
	bad_dessert = gets.chomp
	deleted_dessert = Dessert.where({:name => bad_dessert}).first
	deleted_dessert.delete
	welcome
end

def rate_dessert
	puts "Here are all your desserts:"
	desserts = Dessert.all
	desserts.each {|dessert| puts dessert.name}
	puts "Which dessert would you like to rate?"
	choice = gets.chomp
	dessert_choice = Dessert.where({:name => choice}).first
	puts "What would you like to rate the dessert? 1 being completely awful to 5 which is epic."
	rate_response = gets.chomp
	rated_dessert = Dessert.create({:name => dessert_choice.name, :yum_factor => rate_response})
	dessert_choice.delete
	welcome
end

def create_meal
	puts "Here are all your entrees:"
	entrees = Entree.all
	entrees.each {|entree| puts entree.name}
	puts "Here are all your desserts:"
	desserts = Dessert.all
	desserts.each {|dessert| puts dessert.name}
	puts "Which entree would you like to select?"
	entree_choice = gets.chomp
	good_entree = Entree.where({:name => entree_choice}).first
	puts "Which dessert would you like to select?"
	dessert_choice = gets.chomp
	good_dessert = Dessert.where({:name => dessert_choice}).first
	new_meal = Meal.create({:dessert_id => good_dessert.id, :entree_id => good_entree.id})
	puts "You have created a meal with the entree '#{good_entree.name}' and the dessert '#{good_dessert.name}'!"
	welcome
end

def view_menu
	puts "Here are all your entree options:"
	entrees = Entree.all
	entrees.each {|entree| puts entree.name}
	puts "Here are all your dessert options:"
	desserts = Dessert.all
	desserts.each do |dessert|
		puts " #{dessert.name} rating: #{dessert.yum_factor}"
	end
	welcome
end

# def view_meal
# 	puts "Here are all your created meal plans:"
# 	meals = Meal.all
# 	# binding.pry
# 	meals.each do |meal|
# 		binding.pry
# 		puts meal.entree.name + ' with ' + meal.dessert.name
# 	end

# 	welcome
# end

welcome