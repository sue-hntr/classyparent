class CreatePublicSchools < ActiveRecord::Migration
  def change
    create_table :public_schools do |t|
		t.string	:teachername
    	t.string	:grade
    	t.string	:teacher_email
    	t.string	:teacher_cell
    	t.integer	:teacher_userid
    	t.string	:schoolname
    	t.string	:school_district
		t.string	:school_email
		t.string	:school_url
		t.string	:school_phone
		t.string	:emergency_contactname
		t.string	:emergency_contactphone
    	t.string	:address1
    	t.string	:address2
    	t.string	:city
    	t.string	:state
    	t.string	:zipcode
    	t.integer	:school_userid
    	t.float    	:latitude
    	t.float    	:longitude
    	t.float    	:old_latitude
    	t.float    	:old_longitude
      t.timestamps null: false
    end
  end
end
