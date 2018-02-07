class DropChildrensTable < ActiveRecord::Migration
def up
    drop_table :children
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end