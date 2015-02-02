class CreateNewspostAttachments < ActiveRecord::Migration
  def change
    create_table :newspost_attachments do |t|
      t.integer :newspost_id
      t.string :file

      t.timestamps
    end
  end
end
