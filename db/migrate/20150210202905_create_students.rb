class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :class_code
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :students, [:user_id, :created_at]

  end
end
