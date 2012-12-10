class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms, id: false do |t|
      t.string :identifier
      t.string :display_name
    end
    add_index :platforms, :identifier, unique: true
  end
end
