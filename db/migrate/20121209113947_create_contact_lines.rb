class CreateContactLines < ActiveRecord::Migration
  def change
    create_table :contact_lines do |t|
      t.references :user
      t.string :category, null: false
      t.string :content, null: false
      t.string :description

      t.timestamps
    end
    add_index :contact_lines, :user_id
    add_index :contact_lines, :category
  end
end
