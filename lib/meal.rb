class Meal < ActiveRecord::Base
	belongs_to :entree
	belongs_to :dessert
end