class DropHobbyClassSportsTable < ActiveRecord::Migration
def up
  	drop_table :hobby_class_sports
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end