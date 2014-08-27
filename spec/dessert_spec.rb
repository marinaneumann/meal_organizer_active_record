require 'spec_helper'

describe Dessert do 
	it 'validates that a dessert has a name' do 
		new_dessert = Dessert.new({:name => ' ', :yum_factor => 0})
		expect(new_dessert.save).to eq false
	end

	it 'should lowercase the name of a dessert' do 
		new_dessert = Dessert.create({:name => 'CHOCOLATE CHIP COOKIE', :yum_factor => 4})
		expect(new_dessert.name).to eq 'chocolate chip cookie'
	end


	it 'has many meals' do 
		test_dessert = Dessert.create({:name => 'Strawberry CheeseCake', :yum_factor => 5})
		test_meal = Meal.create(:dessert_id => test_dessert.id)
		expect(test_dessert.meals).to eq [test_meal]
	end

	describe :yum_factor_greater_than_three do
		it "should list all occurences where the yum factor great than 3" do 
			new_dessert1 = Dessert.create({:name => 'Strawberry Short Cake', :yum_factor => 5 })
			new_dessert2 = Dessert.create({:name => 'Coconut Balls', :yum_factor => 2})
			new_dessert3 = Dessert.create({:name => 'Blueberry Sherbert', :yum_factor => 3})
			new_dessert4 = Dessert.create({:name => 'Slut Brownies', :yum_factor => 4})
			expect(Dessert.yum_factor_greater_than_three).to eq [new_dessert1, new_dessert4]
		end
	end

end