class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
