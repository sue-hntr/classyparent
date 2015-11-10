class CreateChildAttendances < ActiveRecord::Migration
  def change
    create_table :child_attendances do |t|
    	t.integer   :child_id
        t.integer   :school_id
      t.timestamps null: false
    end
  end
end
