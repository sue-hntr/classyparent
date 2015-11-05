class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
		t.string	:fname
    	t.string	:lname
    	t.string	:nickname
    	t.string	:parent_name
        t.integer   :parent_id
    	t.text		:family_info
        t.text      :bdaymonth
        t.boolean   :bdaywkone
        t.boolean   :bdaywktwo
        t.boolean   :bdaywkthree
        t.boolean   :bdaywkfour
    	t.string	:hobbyteachone
    	t.string	:hobbyteachtwo
    	t.string	:hobbyteachthree
        t.string    :hobbyteachfour
    	t.float    	:old_latitude
    	t.float    	:old_longitude
	    t.timestamps null: false
    end
  end
end
