class CreateTipMapRelations < ActiveRecord::Migration
  def change
    create_table :tip_map_relations do |t|
      t.references :tip, index: true, foreign_key: true
      t.references :map, index: true, foreign_key: true
      t.string :category

      t.timestamps null: false
    end
  end
end
