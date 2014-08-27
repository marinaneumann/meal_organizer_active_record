class Dessert < ActiveRecord::Base
	validates :name, :presence => true

	has_many :meals

	before_create :downcase_name

	scope :yum_factor_greater_than_three, -> {Dessert.where("yum_factor > 3")}

	private

	def downcase_name
		self.name = self.name.downcase
	end

end