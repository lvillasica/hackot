class CreateReliefCenters < ActiveRecord::Migration
  def change
    create_table :relief_centers do |t|
      t.string :identifier
      t.string :name
      t.string :password
      t.string :description
      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10

      t.timestamps
    end

    add_index :relief_centers, :identifier, :unique => true
  end
end
