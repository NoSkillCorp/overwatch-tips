class PopulateMaps < ActiveRecord::Migration
  def change
    Map.delete_all
    Map.create(name: "Dorado", description: "", image_path: "maps/Dorado.jpg")
    Map.create(name: "Gibraltar", description: "", image_path: "maps/Gibraltar.jpg")
    Map.create(name: "Hanamura", description: "", image_path: "maps/Hanamura.jpg")
    Map.create(name: "Hollywood", description: "", image_path: "maps/Hollywood.jpg")
    Map.create(name: "Ilios", description: "", image_path: "maps/Ilios.jpg")
    Map.create(name: "Kings Row", description: "", image_path: "maps/Kings_Row.jpg")
    Map.create(name: "Lijang Tower", description: "", image_path: "maps/LijangTower.png")
    Map.create(name: "Nepal", description: "", image_path: "maps/Nepal.png")
    Map.create(name: "Numbani", description: "", image_path: "maps/Numbani.jpg")
    Map.create(name: "Route: 66", description: "", image_path: "maps/Route66.png")
    Map.create(name: "Temple Of Anubis", description: "", image_path: "maps/TempleOfAnubis.jpg")
    Map.create(name: "Volskaya", description: "", image_path: "maps/Volskaya.jpg")
  end

end
