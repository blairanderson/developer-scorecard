class CreateKeychains < ActiveRecord::Migration
  def change
    create_table :keychains do |t|
      t.integer :user_id
      t.string :api_secret,   null: false
      t.string :api_token,    null: false
      t.string :oauth_secret
      t.string :oauth_token

      t.timestamps
    end
    add_index :keychains, :user_id
  end
end
