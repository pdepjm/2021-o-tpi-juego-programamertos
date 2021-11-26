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
	const type
	const property image = "./assets/objects/bonus/bonus-" + type + ".png"
	var property position
	const property stopsExplosion = false
	
	method render(){
		game.addVisual(self)
	}
	
	method harm(){
        game.removeVisual(self)
    }
	
	method drop(newPosition) {
		position = newPosition
		game.addVisual(self)
	}
}

class ExtraBomb inherits PowerUp(type = "bomb"){
	method affect(){
		game.say(self, "aparezco")
		//player.bombs() = player.bombs() + 1
	}
}

class ExtraDistance inherits PowerUp(type = "potion-green"){
}

class ExtraSpeed inherits PowerUp(type = "potion-red") {
}


