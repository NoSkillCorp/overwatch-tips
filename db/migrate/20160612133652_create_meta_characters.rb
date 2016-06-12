class CreateMetaCharacters < ActiveRecord::Migration
  def change
    create_table :meta_characters do |t|
      t.integer :strong_character_id
      t.integer :weak_character_id

      t.timestamps null: false
    end
  end
end
