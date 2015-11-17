class Parent < ActiveRecord::Base

	#associations
	has_many	:children, through: :families
	has_many 	:families


	#validations	
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true

	
	#callbacks
	geocoded_by :full_address

	after_validation :geocode

	#methods
	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end
end
