class Friendship < ActiveRecord::Base
	belongs_to	:children
	belongs_to	:playfriends, class_name: 'child'
end
