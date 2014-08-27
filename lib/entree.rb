class Entree < ActiveRecord::Base
	has_many :meals

	validates :name, :presence => true

end