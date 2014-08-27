require 'spec_helper'

describe Desert do 
	it 'has many meals' do 
		test_desert = Desert.create({:name => 'Strawberry CheeseCake'})
		test_meal = Meal.create(:desert_id => test_desert.id)
		expect(test_desert.meals).to eq [test_meal]
	end
end