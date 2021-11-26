import wollok.game.*
import tile.*
import players.*

//active bonus (WIP Mati)
object normal {
	
}

//powerUps
class PowerUp {
	var property canBeSteppedOn = true
    const property destroyable = true
    const property stopsExplosion = false
	var property position
    
	const type
	const property image = "./assets/objects/bonus/bonus-" + type + ".png"
	
	method render(){
		game.addVisual(self)
	}
	
	method harm(){
        game.removeVisual(self)
    }
    
   	//the powerUp causes an effect on the player that picks it up
    method affect(){
    	game.onCollideDo(self, { player => 
			game.say(self, "extra " + type)
			type.effect(player)
			game.removeVisual(self)
    	})
    }
}

object bomb{
	method effect(player){
		player.bonusBomb()
	}
}

object distance{
	method effect(player){
		player.bonusDistance()
	}	
}

object speed{
	method effect(player){
		player.bonusSpeed()
	}
}

