class PopulateDatabase < ActiveRecord::Migration
  def change
    # Gather (&fix) all Character and Map populating migrations.
    # Better to be executed AFTER (friendly_id) create
    Character.delete_all
    Character.create(name: "Bastion", description: "Bip bip bop bowi bip !", image_path: "characters/Bastion.png")
    Character.create(name: "D.Va", description: "Nerf this !", image_path: "characters/DVa.png")
    Character.create(name: "Genji", description: "Ryuu-jin no ken wo ku-ra-eh !", image_path: "characters/Genji.png")
    Character.create(name: "Hanzo", description: "Ryuu-ga, Wa-ga-te-ki-wo, Ku-ra-u !", image_path: "characters/Hanzo.png")
    Character.create(name: "Junkrat", description: "Start you engines !", image_path: "characters/Junkrat.png")
    Character.create(name: "Lúcio", description: "Let's break it down !", image_path: "characters/Lucio.png")
    Character.create(name: "McCree", description: "It's high noon somwhere in the world.", image_path: "characters/McCree.png")
    Character.create(name: "Mei", description: "That's a world worth fighting for !", image_path: "characters/Mei.png")
    Character.create(name: "Mercy", description: "Heroes never die! ... for a price.", image_path: "characters/Mercy.png")
    Character.create(name: "Pharah", description: "Justice rains from above !", image_path: "characters/Pharah.png")
    Character.create(name: "Reaper", description: "Die, Die, DIE !", image_path: "characters/Reaper.png")
    Character.create(name: "Reinhardt", description: "We are honor !", image_path: "characters/Reinhardt.png")
    Character.create(name: "Roadhog", description: "I'm a one man apocalypse !", image_path: "characters/Roadhog.png")
    Character.create(name: "Soldier:76", description: "Young punks, get off my lawn !", image_path: "characters/Soldier76.png")
    Character.create(name: "Symmetra", description: "My teleporter is online. We move quickly.", image_path: "characters/Symmetra.png")
    Character.create(name: "Torbjörn", description: "Molten core !", image_path: "characters/Torbjorn.png")
    Character.create(name: "Tracer", description: "Don't worry loves, cavalry's here !", image_path: "characters/Tracer.png")
    Character.create(name: "Widowmaker", description: "No one can hide from my sight.", image_path: "characters/Widowmaker.png")
    Character.create(name: "Winston", description: "Did someone say ... peanut butter ?", image_path: "characters/Winston.png")
    Character.create(name: "Zarya", description: "Fire at will !", image_path: "characters/Zarya.png")
    Character.create(name: "Zenyatta", description: "Pass ... into the iris.", image_path: "characters/Zenyatta.png")
    
    Map.delete_all
    Map.create(name: "Dorado", description: "Mexico City, Mexico", image_path: "maps/Dorado.png")
    Map.create(name: "Watchpoint: Gibraltar", description: "Gibraltar, Spain", image_path: "maps/Gibraltar.png")
    Map.create(name: "Hanamura", description: "Japan", image_path: "maps/Hanamura.png")
    Map.create(name: "Hollywood", description: "Los Angeles, USA", image_path: "maps/Hollywood.png")
    Map.create(name: "Ilios", description: "Greece", image_path: "maps/Ilios.png")
    Map.create(name: "Kings Row", description: "London, England", image_path: "maps/KingsRow.png")
    Map.create(name: "Lijang Tower", description: "China", image_path: "maps/LijangTower.png")
    Map.create(name: "Nepal", description: "Himalaya, Nepal", image_path: "maps/Nepal.png")
    Map.create(name: "Numbani", description: "African west coast", image_path: "maps/Numbani.png")
    Map.create(name: "Route: 66", description: "Southwest USA", image_path: "maps/Route66.png")
    Map.create(name: "Temple Of Anubis", description: "Egypt", image_path: "maps/TempleOfAnubis.png")
    Map.create(name: "Volskaya", description: "St. Petersburg, Russia", image_path: "maps/Volskaya.png")
  end
end
