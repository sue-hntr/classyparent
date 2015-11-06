class Child < ActiveRecord::Base
	belongs_to	:parents
	has_many	:playfriends, through: :friendships
	has_many	:school_hobbies, through: :child_attendance
end
