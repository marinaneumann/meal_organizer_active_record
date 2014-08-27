class Desert < ActiveRecord::Base
	validates :name, :presence => true

	has_many :meals

	before_create :downcase_name

	private

	def downcase_name
		self.name = self.name.downcase
	end
	
end