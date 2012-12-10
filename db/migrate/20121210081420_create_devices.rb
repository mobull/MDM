class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :devices, :user_id
  end
end
