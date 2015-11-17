class ChildAttendance < ActiveRecord::Base
	belongs_to	:child
	belongs_to	:school_hobby
end
