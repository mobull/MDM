class CreateDeviceOwnerships < ActiveRecord::Migration
  def change
    create_table :device_ownerships do |t|
      t.string :name

      t.timestamps
    end
  end
end
