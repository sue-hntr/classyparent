class Family < ActiveRecord::Base
	belongs_to	:parents
	belongs_to	:children
end
