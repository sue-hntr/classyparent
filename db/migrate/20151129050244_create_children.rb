class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
		t.string	:fname
    	t.string	:lname
    	t.string	:nickname
    	t.string	:parent_name
        t.integer   :parent_id
    	t.string	:family_info
        t.string	:age_years
        t.string    :bdaymonth
    	t.string	:hobbyteachone
    	t.string	:hobbyteachtwo
    	t.string	:hobbyteachthree
        t.string    :hobbyteachfour
	    t.timestamps null: false
    end
  end
end
