class AddReliefCenterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :event_id, :integer
  end

  def up
    drop_table :timelogs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
