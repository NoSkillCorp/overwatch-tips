class AddCategoryToTips < ActiveRecord::Migration
  def change
    add_column :tips, :category, :string
  end
end
