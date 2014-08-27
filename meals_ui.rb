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
	puts "Put 'l' to see menu"
	puts "Put 'd' to add a dessert"
	puts "Put 'r' to rate a dessert"
	puts "Put 'm' to create a meal"

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



welcome