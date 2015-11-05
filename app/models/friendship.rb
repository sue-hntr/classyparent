class Friendship < ActiveRecord::Base
	belongs_to	:children
	belongs_to	:playfriend, class_name: 'child'
end
