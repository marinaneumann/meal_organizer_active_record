require 'active_record'
require './lib/dessert'
require './lib/entree'
require './lib/meals'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
	puts "Welcome to Meal Organizer!!!"
	puts "Put 'e' to add an entree"
	puts "Put 'l' to see menu of food options"
	puts "Put 'd' to add a dessert"
	puts "Put 'r' to rate a dessert"
	puts "Put 'm' to create a meal"
	puts "Put 'v' to all created meal plans"

	choice =gets.chomp

	if choice == 'e'
		add_entree
	elsif choice == 'd'
		add_dessert
	elsif choice == 'r'
		rate_dessert
	elsif choice == 'm'
		create_meal
	elsif choice == 'l'
		view_menu
	elsif choice == 'v'
		view_meals
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

def add_dessert
	puts "What dessert would you like to add?"
	choice = gets.chomp
	new_dessert = Dessert.create({:name => choice})
	welcome
end

def rate_dessert
	puts "Here are all your desserts:"
	desserts = Dessert.all
	desserts.each {|dessert| put dessert.name}
	puts "Which dessert would you like to rate?"
	choice = gets.chomp
	dessert_choice = Dessert.where({:name => choice})
	puts "What would you like to rate the dessert? 1 being completely awful to 5 which is epic."
	rate_response = gets.chomp
	rated_dessert = Dessert.create({:name => dessert_choice.name, :yum_factor => rate_response})
	welcome
end

def create_meal
	puts "Here are all your entrees:"
	entrees = Entree.all
	entrees.each {|entree| puts entree.name}
	puts "Here are all your desserts:"
	desserts = Dessert.all
	desserts.each {|dessert| put dessert.name}
	puts "Which entree would you like to select?"
	entree_choice = gets.chomp
	puts "Which dessert would you like to select?"
	dessert_choice = gets.chomp
	new_meal = Meal.create({:dessert_id => dessert_choice.id, :entree_id => entree_choice.id})
end

# def view_menu

# end



welcome