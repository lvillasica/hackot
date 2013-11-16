class AddAuthToReliefCenters < ActiveRecord::Migration
  def change
    add_column :relief_centers, :provider, :string
    add_column :relief_centers, :uid, :string
    add_column :relief_centers, :email, :string
  end
end
