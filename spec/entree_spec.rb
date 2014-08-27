require 'spec_helper'

describe Entree do 
	it 'validates the presence of name of an entree' do 
		new_entree = Entree.new({:name => ' '})
		expect(new_entree.save).to eq false
	end

	it 'should lowercase the name of an entree' do 
		new_entree = Entree.create({:name => 'ENCHILADAS'})
		expect(new_entree.name).to eq 'enchiladas'
	end

	it 'has many meals' do 
		test_entree = Entree.create({:name => 'Parmesean Chicken'})
		test_meal = Meal.create({:entree_id => test_entree.id})
		expect(test_entree.meals).to eq [test_meal]
	end

end