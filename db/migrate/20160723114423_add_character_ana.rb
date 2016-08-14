class AddCharacterAna < ActiveRecord::Migration
  def change
    Character.create(name: "Ana", description: "Time to sleep.", image_path: "characters/Ana.png")
  end
end
