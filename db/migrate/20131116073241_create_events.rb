class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :relief_center_id
      t.integer :volunteers_needed
      t.string :details
      t.integer :status

      t.timestamps
    end
  end
end
