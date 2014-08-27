require 'spec_helper'

describe Meal do
	it 'belongs to a entree' do 
		test_entree = Entree.create({:name => 'Spagetti and Meatballs'})
		test_meal = Meal.create({:entree_id => test_entree.id})
		expect(test_meal.entree).to eq test_entree
	end

	it 'belongs to a desert' do 
		test_desert = Desert.create({:name => 'Slut Brownies'})
		test_meal = Meal.create({:desert_id => test_desert.id})
		expect(test_meal.desert).to eq test_desert
	end
end