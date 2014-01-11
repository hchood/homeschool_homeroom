class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :author_id, null: false
      t.integer :group_id, null: false
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
