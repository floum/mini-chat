class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :name
      t.string :profile_url
      t.string :avatar_url
      t.string :uid

      t.timestamps null: false
    end

    add_index :users, :uid
    add_index :users, :provider
    add_index :users, [:uid, :provider], unique: true
  end
end
