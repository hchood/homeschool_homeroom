class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :organizer_id, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.string :location, null: false

      t.timestamps
    end

    add_index :groups, [:name], unique: true
  end
end
