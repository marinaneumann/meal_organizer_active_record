require 'spec_helper'

describe Meal do
	it 'belongs to a entree' do 
		test_entree = Entree.create({:name => 'Spagetti and Meatballs'})
		test_meal = Meal.create({:entree_id => test_entree.id})
		expect(test_meal.entree).to eq test_entree
	end

	it 'belongs to a desert' do 
		test_dessert = Dessert.create({:name => 'Slut Brownies', :yum_factor => 5})
		test_meal = Meal.create({:dessert_id => test_dessert.id})
		expect(test_meal.dessert).to eq test_dessert
	end
end