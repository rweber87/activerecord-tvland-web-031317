class Actor < ActiveRecord::Base

	attr_accessor :first_name, :last_name

	has_many :characters
	has_many :shows, through: :characters


	def full_name
		first_name = self.first_name
		last_name = self.last_name
		"#{first_name} #{last_name}"
	end

	def list_roles
		roles = []
		self.characters.each do |character_show|
			roles << "#{character_show.name} - #{character_show.show.name}"
		end
		roles
	end

  
end