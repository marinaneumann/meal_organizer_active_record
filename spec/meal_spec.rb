require 'spec_helper'

describe Meal do 
	it 'belongs to a entree' do 
		test_entree = Entree.create({:name => 'Spagetti and Meatballs'})
		test_meal = Meal.create({:entree_id => test_entree.id})
		expect(test_meal.entree).to eq test_entree
	end
end