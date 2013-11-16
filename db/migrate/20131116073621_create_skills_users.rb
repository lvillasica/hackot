class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users, :id => false do |t|
      t.belongs_to :skill
      t.belongs_to :user
    end

    add_index :skills_users, [:user_id, :skill_id], :unique => true
  end
end
