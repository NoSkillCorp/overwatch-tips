class AddImagePathToGamingObject < ActiveRecord::Migration
  def change
    add_column :gaming_objects, :image_path, :string
  end
end
