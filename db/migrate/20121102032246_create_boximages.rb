class CreateBoximages < ActiveRecord::Migration
  def change
    create_table :boximages do |t|
      t.string :name
      t.string :description
      t.references :user

      t.timestamps
    end
    add_index :boximages, [:user_id, :created_at]
  end
end
