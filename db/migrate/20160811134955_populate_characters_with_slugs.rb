class PopulateCharactersWithSlugs < ActiveRecord::Migration
  def change
    Character.delete_all
    Character.create(name: "Bastion", description: "", image_path: "characters/Bastion.png")
    Character.create(name: "D.Va", description: "", image_path: "characters/DVa.png")
    Character.create(name: "Genji", description: "", image_path: "characters/Genji.png")
    Character.create(name: "Hanzo", description: "", image_path: "characters/Hanzo.png")
    Character.create(name: "Junkrat", description: "", image_path: "characters/Junkrat.png")
    Character.create(name: "Lúcio", description: "", image_path: "characters/Lucio.png")
    Character.create(name: "McCree", description: "", image_path: "characters/McCree.png")
    Character.create(name: "Mei", description: "", image_path: "characters/Mei.png")
    Character.create(name: "Mercy", description: "", image_path: "characters/Mercy.png")
    Character.create(name: "Pharah", description: "", image_path: "characters/Pharah.png")
    Character.create(name: "Reaper", description: "", image_path: "characters/Reaper.png")
    Character.create(name: "Reinhardt", description: "", image_path: "characters/Reinhardt.png")
    Character.create(name: "Roadhog", description: "", image_path: "characters/Roadhog.png")
    Character.create(name: "Soldier:76", description: "", image_path: "characters/Soldier76.png")
    Character.create(name: "Symmetra", description: "", image_path: "characters/Symmetra.png")
    Character.create(name: "Torbjörn", description: "", image_path: "characters/Torbjorn.png")
    Character.create(name: "Tracer", description: "", image_path: "characters/Tracer.png")
    Character.create(name: "Widowmaker", description: "", image_path: "characters/Widowmaker.png")
    Character.create(name: "Winston", description: "", image_path: "characters/Winston.png")
    Character.create(name: "Zarya", description: "", image_path: "characters/Zarya.png")
    Character.create(name: "Zenyatta", description: "", image_path: "characters/Zenyatta.png")
    
    #Descriptions
    
    Character.find_by(name: "Bastion").update_column(:description, "Bip bip bop bowi bip !")
		Character.find_by(name: "D.Va").update_column(:description, "Nerf this !")
		Character.find_by(name: "Genji").update_column(:description, "Ryuu-jin no ken wo ku-ra-eh !")
		Character.find_by(name: "Hanzo").update_column(:description, "Ryuu-ga, Wa-ga-te-ki-wo, Ku-ra-u !")
		Character.find_by(name: "Junkrat").update_column(:description, "Start you engines !")
		Character.find_by(name: "Lúcio").update_column(:description, "Let's break it down !")
		Character.find_by(name: "McCree").update_column(:description, "It's high noon somwhere in the world.")
		Character.find_by(name: "Mei").update_column(:description, "That's a world worth fighting for !")
		Character.find_by(name: "Mercy").update_column(:description, "Heroes never die! ... for a price.")
		Character.find_by(name: "Pharah").update_column(:description, "Justice rains from above !")
		Character.find_by(name: "Reaper").update_column(:description, "Die, Die, DIE !")
		Character.find_by(name: "Reinhardt").update_column(:description, "We are honor !")
		Character.find_by(name: "Roadhog").update_column(:description, "I'm a one man apocalypse !")
		Character.find_by(name: "Soldier:76").update_column(:description, "Young punks, get off my lawn !")
		Character.find_by(name: "Symmetra").update_column(:description, "My teleporter is online. We move quickly.")
		Character.find_by(name: "Torbjörn").update_column(:description, "Molten core !")
		Character.find_by(name: "Tracer").update_column(:description, "Don't worry loves, cavalry's here !")
		Character.find_by(name: "Widowmaker").update_column(:description, "No one can hide from my sight.")
		Character.find_by(name: "Winston").update_column(:description, "Did someone say ... peanut butter ?")
		Character.find_by(name: "Zarya").update_column(:description, "Fire at will !")
		Character.find_by(name: "Zenyatta").update_column(:description, "Pass ... into the iris.")
  end
end
