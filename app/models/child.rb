class Child < ActiveRecord::Base
	belongs_to	:parents
	belongs_to	:families
	has_many	:playfriends
	has_many	:school_hobbies
end
