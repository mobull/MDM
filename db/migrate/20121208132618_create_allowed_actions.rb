class CreateAllowedActions < ActiveRecord::Migration
  def change
    create_table :allowed_actions, id: false do |t|
      t.references :role
      t.string :name
    end
    add_index :allowed_actions, :role_id
  end
end
