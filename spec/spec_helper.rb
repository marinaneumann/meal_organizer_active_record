require 'active_record'
require 'rspec'
require 'pg'
require 'entree'
require 'dessert'
require 'meal'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
	config.after(:each) do
		Entree.all.each { |entree| entree.destroy }
		Dessert.all.each { |dessert| dessert.destroy }
		Meal.all.each { |meal| meal.destroy}
	end
end