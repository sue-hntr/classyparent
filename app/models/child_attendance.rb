class ChildAttendance < ActiveRecord::Base
	has_many	:children
	has_many	:school_hobbies

end
