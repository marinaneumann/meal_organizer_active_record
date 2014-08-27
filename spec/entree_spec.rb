require 'spec_helper'

describe Entree do 
	it 'has many meals' do 
		test_entree = Entree.create({:name => 'Parmesean Chicken'})
		test_meal = Meal.create({:entree_id => test_entree.id})
		expect(test_entree.meals).to eq [test_meal]
	end

end