class AddDeviceOwnershipIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :device_ownership_id, :integer
    add_index :devices, :device_ownership_id
  end
end
