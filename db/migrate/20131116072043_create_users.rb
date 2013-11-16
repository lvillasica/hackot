class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :mobile

      t.timestamps
    end

    add_index :users, :mobile, :unique => true
  end
end
