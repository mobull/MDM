class RemoveShouldIncludeEveryoneFromGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :should_include_everyone
  end

  def down
    add_column :groups, :should_include_everyone, :boolean
    add_index :groups, :should_include_everyone
  end
end
