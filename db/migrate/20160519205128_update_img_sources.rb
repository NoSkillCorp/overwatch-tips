class UpdateImgSources < ActiveRecord::Migration
  def change
    m1 = Map.find_by(name: "Kings Row")
    m1.image_path = "maps/KingsRow.png"
    m1.description = "London, England"
    m1.save
    
    m2 = Map.find_by(name: "Lijang Tower")
    m2.image_path = "maps/LijangTower.png"
    m2.description = "China"
    m2.save
    
    m3 = Map.find_by(name: "Dorado")
    m3.image_path = "maps/Dorado.png"
    m3.description = "Mexico City, Mexico"
    m3.save
    
    m4 = Map.find_by(name: "Gibraltar") || Map.find_by(name: "Watchpoint: Gibraltar")
    m4.name = "Watchpoint: Gibraltar"
    m4.image_path = "maps/Gibraltar.png"
    m4.description = "Gibraltar, Spain"
    m4.save
    
    m5 = Map.find_by(name: "Hanamura")
    m5.image_path = "maps/Hanamura.png"
    m5.description = "Japan"
    m5.save
    
    m6 = Map.find_by(name: "Hollywood")
    m6.image_path = "maps/Hollywood.png"
    m6.description = "Los Angeles, USA"
    m6.save
    
    m7 = Map.find_by(name: "Ilios")
    m7.image_path = "maps/Ilios.png"
    m7.description = "Greece"
    m7.save
    
    m8 = Map.find_by(name: "Nepal")
    m8.image_path = "maps/Nepal.png"
    m8.description = "Himalaya, Nepal"
    m8.save
    
    m9 = Map.find_by(name: "Numbani")
    m9.image_path = "maps/Numbani.png"
    m9.description = "African west coast"
    m9.save
    
    m10 = Map.find_by(name: "Temple Of Anubis")
    m10.image_path = "maps/TempleOfAnubis.png"
    m10.description = "Egypt"
    m10.save
    
    m11 = Map.find_by(name: "Volskaya") || Map.find_by(name: "Volskaya Industries")
    m11.name = "Volskaya Industries"
    m11.image_path = "maps/Volskaya.png"
    m11.description = "St. Petersburg, Russia"
    m11.save
    
    m12 = Map.find_by(name: "Route: 66")
    m12.image_path = "maps/Route66.png"
    m12.description = "Southwest USA"
    m12.save
  end
end
