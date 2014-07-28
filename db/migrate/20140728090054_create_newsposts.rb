class CreateNewsposts < ActiveRecord::Migration
  def change
    create_table :newsposts do |t|
      t.string :content
      t.integer :user_id
      t.string :images

      t.timestamps
    end
    add_index :newsposts, [:user_id, :created_at]
  end
end
