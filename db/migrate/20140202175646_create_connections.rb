class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :provider_cd, null: false, default: 0
      t.string  :identity, unique: true, null: false, default: ""

      t.timestamps
    end

    add_index :connections, :user_id
    add_index :connections, :provider_cd
    add_index :connections, [:user_id, :provider_cd], unique: true, name: 'by_user_and_provider'
  end
end
