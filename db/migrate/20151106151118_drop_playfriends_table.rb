class DropPlayfriendsTable < ActiveRecord::Migration
  def up
  	drop_table :playfriends
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
