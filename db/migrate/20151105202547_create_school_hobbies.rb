class CreateSchoolHobbies < ActiveRecord::Migration
  def change
    create_table :school_hobbies do |t|
		t.string	:teachername
    	t.string	:class_name
        t.boolean   :is_public_school
        t.string    :grade
    	t.string	:teacher_email
    	t.string	:teacher_cell
    	t.string	:schoolname
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
    	t.string	:carpool
    	t.float    	:latitude
    	t.float    	:longitude
    	t.float    	:old_latitude
    	t.float    	:old_longitude
      t.timestamps null: false
    end
  end
end
