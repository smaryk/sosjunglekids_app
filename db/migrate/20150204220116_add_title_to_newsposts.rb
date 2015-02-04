class AddTitleToNewsposts < ActiveRecord::Migration
  def change
    add_column :newsposts, :title, :text
  end
end
