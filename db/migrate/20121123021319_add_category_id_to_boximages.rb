class AddCategoryIdToBoximages < ActiveRecord::Migration
  def change
  	add_column :boximages, :category_id, :integer
  end
end
