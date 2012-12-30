class RenameColumnValueInGlobalVariables < ActiveRecord::Migration
  def change
    rename_column :global_variables, :value, :content
  end
end
