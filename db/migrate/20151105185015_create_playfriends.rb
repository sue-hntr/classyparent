class CreatePlayfriends < ActiveRecord::Migration
  def change
    create_table :playfriends do |t|
		t.string	:fname
    	t.string	:lname
    	t.string	:nickname
		t.string	:email
		t.string	:cellphone
    	t.string	:address1
    	t.string	:address2
    	t.string	:city
    	t.string	:state
    	t.string	:zipcode
    	t.string	:parent_name1
    	t.text		:family_info
    	t.datetime	:bday
    	t.float    	:latitude
    	t.float    	:longitude
    	t.integer	:userid
    	t.integer	:teacher_userid
    	t.integer	:hobbyteach1_userid
    	t.integer	:hobbyteach2_userid
    	t.integer	:hobbyteach3_userid
    	t.float    	:old_latitude
    	t.float    	:old_longitude
      t.timestamps null: false
    end
  end
end
