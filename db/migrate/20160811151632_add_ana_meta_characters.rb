class AddAnaMetaCharacters < ActiveRecord::Migration
  def change
    ana = Character.find_by(name: "Ana")
    
    genji = Character.find_by(name: "Genji")
    tracer = Character.find_by(name: "Tracer")
    winston = Character.find_by(name: "Winston")
    dva = Character.find_by(name: "D.Va")
    hanzo = Character.find_by(name: "Hanzo")
    widow = Character.find_by(name: "Widowmaker")
    
    roadhog = Character.find_by(name: "Roadhog")
    soldier = Character.find_by(name: "Soldier:76")
    lucio = Character.find_by(name: "Lúcio")
    
    MetaCharacter.create(weak_character: ana, strong_character: genji)
    MetaCharacter.create(weak_character: ana, strong_character: tracer)
    MetaCharacter.create(weak_character: ana, strong_character: winston)
    MetaCharacter.create(weak_character: ana, strong_character: dva)
    MetaCharacter.create(weak_character: ana, strong_character: hanzo)
    MetaCharacter.create(weak_character: ana, strong_character: widow)
    
    MetaCharacter.create(weak_character: roadhog, strong_character: ana)
    MetaCharacter.create(weak_character: soldier, strong_character: ana)
    MetaCharacter.create(weak_character: lucio, strong_character: ana)
  end
end
