class Desert < ActiveRecord::Base
	validates :name, :presence => true
	
	has_many :meals
end