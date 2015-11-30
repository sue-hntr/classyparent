class Friendship < ActiveRecord::Base
	belongs_to	:child
	belongs_to	:playfriend, class_name: 'child'
end
