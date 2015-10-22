class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
		t.string	:fname
    	t.string	:lname
		t.string	:email
		t.string	:cellphone
    	t.string	:address1
    	t.string	:address2
    	t.string	:city
    	t.string	:state
    	t.string	:zipcode
    	t.string	:kid_name
    	t.text		:family_info
    	t.string	:country
    	t.float    	:latitude
    	t.float    	:longitude
    	t.integer	:userid
    	t.float    	:old_latitude
    	t.float    	:old_longitude
      t.timestamps null: false
    end
  end
end
