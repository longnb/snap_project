class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :user_id
      t.references :boximage

      t.timestamps
    end
    
  end
end
