class DropPublicSchoolsTable < ActiveRecord::Migration
   def up
  	drop_table :public_schools
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
