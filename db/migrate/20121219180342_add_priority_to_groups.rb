class AddPriorityToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :priority, :integer
  end
end
