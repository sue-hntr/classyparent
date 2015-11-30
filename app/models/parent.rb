class Parent < ActiveRecord::Base

	#associations
	has_many	:children, through: :families
	has_many 	:families


	#validations	
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true
	validates :fname, presence: true
	validates :lname, presence: true
	validates_format_of :cellphone, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
	validates :address1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zipcode, length: { minimum: 5 }

	
	#callbacks
	geocoded_by :full_address

	after_validation :geocode

	#methods
	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end
end
