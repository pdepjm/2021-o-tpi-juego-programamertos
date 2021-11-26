import wollok.game.*
import tile.*
import players.*
import bomb.*

//active bonus (WIP Mati)
object normalBomb {
	method use(position, owner) {
		if(owner.bombCount() < owner.activeBombs()) { //if the player has bombs available
            const newBomb = new Bomb(owner = owner, position = position)
            newBomb.init()
            owner.bombCount(owner.bombCount() + 1)
        }
	}
}

//powerUps
class PowerUp {
	var property canBeSteppedOn = true
    const property destroyable = true
    const property stopsExplosion = false
	var property position
    
	const type
	const property image = "./assets/objects/bonus/bonus-" + type.name() + ".png"
	
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
    		
    		if(player.isAPlayer()){
				type.effect(player)
				game.removeVisual(self)    			
    		}
    	})
    }
}

object bomb{
	const property name = "bomb"
	
	method effect(player){
		player.bonusBomb()
	}
}

object distance{
	const property name = "distance"
	
	method effect(player){
		player.bonusDistance()
	}	
}

object speed{
	const property name = "speed"
	
	method effect(player){
		player.bonusSpeed()
	}
}

