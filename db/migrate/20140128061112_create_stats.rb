class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :connection_id, null: false, default: 0
      t.integer :type_cd, null: false, default: 0
      t.text :event, null: false, default: ""

      t.timestamps
    end
    add_index :stats, :connection_id
    add_index :stats, :type_cd
    add_index :stats, [:connection_id, :type_cd]
  end
end
