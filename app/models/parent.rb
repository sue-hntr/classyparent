class Parent < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true

	has_many	:children, through: :families
	
	geocoded_by :full_address

	after_validation :geocode

	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end

end
