require 'spec_helper'

describe Desert do 
	it 'validates that a desert has a name' do 
		new_desert = Desert.new({:name => ' '})
		expect(new_desert.save).to eq false
	end

	it 'should lowercase the name of a desert' do 
		new_desert = Desert.create({:name => 'CHOCOLATE CHIP COOKIE'})
		expect(new_desert.name).to eq 'chocolate chip cookie'
	end


	it 'has many meals' do 
		test_desert = Desert.create({:name => 'Strawberry CheeseCake'})
		test_meal = Meal.create(:desert_id => test_desert.id)
		expect(test_desert.meals).to eq [test_meal]
	end
end