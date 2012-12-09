class CreateGlobalVariables < ActiveRecord::Migration
  def change
    create_table :global_variables, id: false do |t|
      t.string :name, null: false
      t.text :value

      t.timestamps
    end
    add_index :global_variables, :name
  end
end
