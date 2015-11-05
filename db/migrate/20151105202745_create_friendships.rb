class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
        t.integer   :child_id
        t.integer	:playfriend_id
      t.timestamps null: false
    end
  end
end
