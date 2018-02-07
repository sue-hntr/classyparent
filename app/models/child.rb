class Child < ActiveRecord::Base
	has_many	:parents, through: :families
	has_many 	:families
	has_many	:playfriends, through: :friendships
	has_many	:friendships
	has_many	:school_hobbies, through: :child_attendances
	has_many	:child_attendances

	#validations

end
