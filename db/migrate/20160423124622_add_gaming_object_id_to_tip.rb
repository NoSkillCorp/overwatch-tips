class AddGamingObjectIdToTip < ActiveRecord::Migration
  def change
    add_reference :tips, :gaming_object, index: true, foreign_key: true
  end
end
