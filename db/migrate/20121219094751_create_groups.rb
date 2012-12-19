class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :should_include_everyone

      t.timestamps
    end

    add_index :groups, :should_include_everyone
  end
end
