class CreateGamingObjects < ActiveRecord::Migration
  def change
    create_table :gaming_objects do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps null: false
    end
  end
end
