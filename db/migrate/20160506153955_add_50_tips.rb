class Add50Tips < ActiveRecord::Migration
  def change
    character = Character.find_by(name: "Reaper")
    Tip.create(gaming_object: character, category: "as", description: "Reaper isn't actually invisible when he uses his Wraith Form. I've overheard on streams that people believe they're \"stealthed\" whenever they use his Wraith form, but it's primarily used as a tool to escape players when you're in danger, to reposition yourself in close-quarters to secure kills on targets that are foolish enough to follow you.")
    Tip.create(gaming_object: character, category: "against", description: "Reaper is able to teleport from long distances, so keep a look out for his red smoke before he emerges to sneak upon you and your team.")
    
    character = Character.find_by(name: "Tracer")
    Tip.create(gaming_object: character, category: "as", description: "Tracer's Ultimate Ability (Pulse Bomb) can be used like a \"sticky\" grenade (like the Plasma Grenade from Halo) to stick players with a devastating ability. Try to stick it on the enemy team when they're grouped up ontop of an objective.")
    Tip.create(gaming_object: character, category: "against", description: "Enemy Tracer giving you problems? Play McCree or Mei. Seriously. McCree is one of the best characters equipped to dealing with Tracer. A quick flashback will stun her long enough for him to use a full round of his peacekeeper for an easy kill.")
    
    character = Character.find_by(name: "Torbjörn")
    Tip.create(gaming_object: character, category: "as", description: "Torbjorn's ultimate gives him a ton of scrap and armor to work with, so when you activate this ability, try to either: setup a turret in an offensive warzone position, rebuild a recently destroyed turret, or use it when your turret is under heavy siege by the opposing team because you repair your turret much faster than you normally would.")
    Tip.create(gaming_object: character, category: "as", description: "Torbjorn's turret cannot see and handle everything on it's own. It's important for you to watch the back of your fellow Torbjorn teammates, because they're incredibly vulnerable to being picked off by the enemy team's offensive characters (including snipers like Widowmaker if he's not in an enclosed position).")
    Tip.create(gaming_object: character, category: "as", description: "Torbjorn can drop armor packs for himself, but more importantly for his teammates whenever he has spare scrap, it's a nice way to support your team when you're already maxxed out your turrets.")
    
    character = Character.find_by(name: "McCree")
    Tip.create(gaming_object: character, category: "against", description: "McCree's ultimate (Deadeye) can end up launching a kill shot on multiple targets in a very short amount of time. So, when you hear \"it's high-noon\" it's time to take cover IMMEDIATELY to avoid getting one-shot-killed!")
    Tip.create(gaming_object: character, category: "against", description: "McCree is one of the most dangerous close-range fighters that you can encounter in Overwatch, if you have to fight him in close corners try to avoid his flash bang and attack him while he's reloading.")
    
    character = Character.find_by(name: "Symmetra")
    Tip.create(gaming_object: character, category: "against", description: "Symmetra is secretly one of the most dangerous characters to engage with in a one-on-one fight, the longer her laser is upon you, the more damage it does. Try to break away from her if you can't finish her off fast!")
    Tip.create(gaming_object: character, category: "against", description: "If you notice the opposing team has a Symmetra, be careful of entering buildings in obscure locations. I've noticed many Symmetra players like to setup all of their turrets in rooms that are alternate pathes and routes to objectives, or around important map advantages like Health packs. If you step into a room, you'll be dead before you even realized what happened!")
    Tip.create(gaming_object: character, category: "against", description: "Symmetra is capable of placing teleporters for her team to transfer through, keep an eye and an ear out in areas where you see large amounts of enemies randomly appearing from. A well placed teleporter can be the difference between victory and defeat!")
    
    character = Character.find_by(name: "Roadhog")
    Tip.create(gaming_object: character, category: "with", description: "Roadhog is one of the few characters in the game that has a way to heal himself FREQUENTLY. So, it's important to priortize healing a tank when you can, but you may be better off healing other targets around if Roadhog is already taking a drink.")
    Tip.create(gaming_object: character, category: "as", description: "Roadhog is easily capable of hooking targets in the air, like Pharah, for a quick hook and shotgun blast attack!")
    
    character = Character.find_by(name: "Pharah")
    Tip.create(gaming_object: character, category: "against", description: "Pharah has one of the most devastating ultimate abilities in the game, keep your eye on the sky because she can sneak behind your team at objectives to hit your team with a barrage of weaponry from above!")
    Tip.create(gaming_object: character, category: "against", description: "Pharah can only be in the air for a short period of time with her jetpack. That's because it requires fuel, so she can't stay up there forever! Try to grab her when she's on the ground if you can't get her when she's in the air.")
    
    character = Character.find_by(name: "Reinhardt")
    Tip.create(gaming_object: character, category: "against", description: "Reinhardt is capable of pinning targets against walls and other nearby objects, which is usually more than enough to one shot squishies like Mercy. Always move when you're against Reinhardt!")
    Tip.create(gaming_object: character, category: "against", description: "Reinhardt is able to pin targets off ledges as well to kill them while killing himself, but depending on when the \"pinning\" ends, it does allow some opponents a chance to recover and jump back onto the map (Tracer, Pharah, Genji, Reaper, Winston, Hanzo, and Widowmaker)")
    Tip.create(gaming_object: character, category: "as", description: "Despite popular belief, Reinhardt's shield can be destroyed if it takes too much damage (over 2000), characters like Bastion can easily overwhelm his shield if he and his team position poorly.")
    Tip.create(gaming_object: character, category: "against", description: "Reinhardt is always vulnerable from behind, but so is his team! Offensive characters should attempt to sneak behind Reinhardt and his team where they're least expecting to be attacked from next.")
    
    character = Character.find_by(name: "Junkrat")
    Tip.create(gaming_object: character, category: "against", description: "Junkrat's ultimate (Rip-Tire) is one of the most devastating abilities to use against opponents that are stacking ontop of an objective. However, it's possible for opponents to \"shoot\" his tire before it successfully arrives. Try to counter it before it's too late for you and your team!")
    Tip.create(gaming_object: character, category: "against", description: "After you kill a Junkrat, you need to immediately run away from his corpse! He drops grenades that can end up killing you or other teammates that are nearby.")

    character = Character.find_by(name: "Lúcio")
    Tip.create(gaming_object: character, category: "as", description: "Lucio has the unique ability of knocking opponents back with a blast of sound (alternate fire), or shooting them. Try to push back characters into bad positions, or even off the edge!")
    Tip.create(gaming_object: character, category: "against", description: "Lucio is able to surprise enemy teams with giving his teammates large speed boosts at the most obscure moments, never take anything for granted when you hear his music booming!")
    Tip.create(gaming_object: character, category: "against", description: "When Lucio drops his ultimate, it's better in some cases to back off of the enemy team until the shields fade, the shield amount can be devastating to get through.")

    character = Character.find_by(name: "Zarya")
    Tip.create(gaming_object: character, category: "as", description: "Zarya may be a tank, but her projected barrier can be used on allies in a pinch to give them some extra survival.")
    Tip.create(gaming_object: character, category: "as", description: "Zarya's ultimate can be devastating with other characters ultimates, like Mei's Blizzard and Tracer's Pulse Bomb. Try to synergize with your teammates to pull off ridiculous combinations!")

    character = Character.find_by(name: "Genji")
    Tip.create(gaming_object: character, category: "as", description: "Genji has the ability of deflecting any incoming projectives every few seconds back towards the source, but it doesn't block projectives like lasers and Mei's freeze ray.")
    Tip.create(gaming_object: character, category: "as", description: "Genji's Swift Strike can be used to reposition himself, but primarily can be useful to secure kills on a target. After securing a kill your Swift Strike's cooldown is immediately refreshed and you can use it again.")
    Tip.create(gaming_object: character, category: "against", description: "Genji's ultimate (Dragonblade) is capable of killing most targets \"normal\" targets immediately, tanks will require a few strikes to kill.")
    Tip.create(gaming_object: character, category: "as", description: "Genji is much better in close range than he may appear, but don't forget to use his alternate fire (fan of knives) in close range situations when there may be multiple targets to hit.")

    character = Character.find_by(name: "Soldier:76")
    Tip.create(gaming_object: character, category: "against", description: "Soldier 76 has the unique ability to lock onto characters with his ultimate to guarentee high amounts of damage. So, try and break line of sight with him for the duration so that you don't end up getting caught for massive amounts of damage!")
    Tip.create(gaming_object: character, category: "as", description: "Soldier 76 may be an offensive character, but his Biotic Field can be a quick way for him to regenerate health for himself and his teammates while they're in the fray.")

    character = Character.find_by(name: "Bastion")
    Tip.create(gaming_object: character, category: "against", description: " Bastion is capable of self-repairing when he's at low HP (similar to Roadhog), but he cannot move, fire, or do anything while he's doing so. Take advantage of this when possible!")

    character = Character.find_by(name: "D.Va")
    Tip.create(gaming_object: character, category: "against", description: "D.VA has one of the best ultimates in the game (self destruction), which can damage any enemy characters in a large radius. If you are in the blast zone (you'll have a red caution indicator) there is a high chance you will die immediately! Take cover and shelter in nearby buildings!")
    Tip.create(gaming_object: character, category: "against", description: "D.VA has unlimited ammo and can fire indefinitely when she's in her mech, so never assume that she's going to have reload before you have to again!")

    character = Character.find_by(name: "Winston")
    Tip.create(gaming_object: character, category: "as", description: "Winston's ultimate (Primal Rage) refreshes the cooldown of his jumps much more frequently. When you go berserk, jump around and send enemies flying as frequently as you can.")
    Tip.create(gaming_object: character, category: "as", description: "Winston also doubles his HP when he uses Primal Rage, but it's important to use this ability when you're low on HP to begin with because it gives you such a massive heal! It's a quick way to overwhelm and surprise your opponents!")

    character = Character.find_by(name: "Mei")
    Tip.create(gaming_object: character, category: "against", description: "Mei is a character that you normally do not want to engage with on your own. If you end up getting frozen, it may be too late to turn around a fight! Try to engage on a Mei with other teammates to ensure a kill.")
    Tip.create(gaming_object: character, category: "against", description: "Mei is capable of drawing enemy fire upon herself, quickly using her ultimate ability (Blizzard) and then encasing herself in ice until it procs to setup her team. Be careful when you over commit against her!")
    Tip.create(gaming_object: character, category: "against", description: "Mei's wall can be destroyed if it's in a bad spot, never just assume that you always have to go around it!")
    
    character = Character.find_by(name: "Hanzo")
    Tip.create(gaming_object: character, category: "as", description: "Hanzo's ultimate (Dragonstrike) summons a dragon that passes through walls and any other objects in it's way. Try to position it in ways to corner your opponents, or with the help of other teammates who are pinning them down with suppressive fire!")
    Tip.create(gaming_object: character, category: "as", description: "Hanzo's scatter arrow can be devastating in close corners while you're inside of buildings, the arrows will bounce off of any nearby objects and bounce again and again for a short while. It can be a tricky way to snipe targets behind Reinhardt's shield.")
    
    character = Character.find_by(name: "Widowmaker")
    Tip.create(gaming_object: character, category: "against", description: "Widowmaker may be labeled as defense, but she is one of the most devastating characters to play against if you're a squishy. If the enemy team has a Widowmaker, try to communicate with your team about her position at all times so that characters like Winston can jump upon her to finish her off quickly!")
    Tip.create(gaming_object: character, category: "against", description: "Widowmaker may be a sniper, but her rifle can be used to fire more rapidly in short ranged situations if she's discovered by other characters. Never assume that she's just going to be a free kill!")
    
    character = Character.find_by(name: "Mercy")
    Tip.create(gaming_object: character, category: "as", description: "Mercy is capable of empowering teammates with a healing ray, or a damaging ray. It's important to switch to a damage ray when you're noticing that your teammate isn't taking a lot of damage so they can secure some extra kills faster. Don't always think that you're JUST doctor!")
    Tip.create(gaming_object: character, category: "as", description: "Mercy is capable of flying short distances to get to enemies. Use your allies as a way to escape from bad situations if you've been cornered by enemies. Your pistol generally won't be enough to keep you safe against most foes!")
    
    character = Character.find_by(name: "Zenyatta")
    Tip.create(gaming_object: character, category: "against", description: "Zenyatta is capable of placing orbs upon teammates, but also upon enemies. If you've been hitten with the Orb of Discord, prepare to take cover if you notice multiple enemies around.")
    Tip.create(gaming_object: character, category: "against", description: "The big sparkly glowy guy with arms may look like a good target to shoot when he lights up for his ultimate, but in reality he will take no damage, and ends up healing anybody near him as well. Try to distance him from his team when he does this ability, potentially with an ability like Mei's Ice Wall.")
  end
end
