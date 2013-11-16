class CreateTimelogs < ActiveRecord::Migration
  def change
    create_table :timelogs do |t|
      t.integer :user_id
      t.datetime :timein
      t.datetime :timeout

      t.timestamps
    end
  end
end
