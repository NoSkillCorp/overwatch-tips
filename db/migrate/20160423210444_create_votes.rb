class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :weight
      t.references :tip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
