class ChildAttendance < ActiveRecord::Base
	belongs_to	:children
	belongs_to	:school_hobbies
end
