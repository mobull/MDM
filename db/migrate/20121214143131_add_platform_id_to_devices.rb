class AddPlatformIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :platform_identifier, :string, null: false, default: 'ios'
    add_index :devices, :platform_identifier
  end
end
