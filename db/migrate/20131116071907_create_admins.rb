class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :login
      t.string :password

      t.timestamps
    end

    add_index :admins, :login, :unique => true
  end
end
