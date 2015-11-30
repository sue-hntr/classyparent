class SchoolHobby < ActiveRecord::Base
	has_many	:children, through: :child_attendances
	has_many	:child_attendances
	
	#validations
	# validates :is_public_school, acceptance: { accept: 'yes' }	
	# validates :schoolname, presence: true
	# validates_format_of :cellphone, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
	# validates :address1, presence: true
	# validates :city, presence: true
	# validates :state, presence: true	
	# validates :zipcode, length: { minimum: 5 }


	#callbacks
	geocoded_by :full_address

	after_validation :geocode

	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end
end
