class Family < ActiveRecord::Base
	belongs_to	:parents
	has_many	:children
end
