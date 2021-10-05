import wollok.game.*
import directions.*
import tile.*
import levels.* //todo temp
import bomb.*

class Player {
	//Properties without initial value
    const property id
    const property color //purple, yellow, red, green
    var property position
    const upBind
    const downBind
    const leftBind
    const rightBind
    const bombKey
    const phaseTime = 500
    
    //Properties with initial value
    var property image = "./assets/characters/dino-right-" + self.color() + ".png"
    var property isAlive = true
    const property canBeSteppedOn = true
    var property bombCount = 0          //Amount of bombs the player has active
    const property destroyable = true   //This property is used by the bomb explosion
    const property stopsExplosion = false //An explosion will continue expanding after hitting a player
    
	method color() = color

    method move(direction) {
        const nextPosition = direction.nextPosition(position)

        if(game.getObjectsIn(nextPosition).all({tile => tile.canBeSteppedOn()})) {
            position = nextPosition
        }
    }

    method dropBomb() {		
        if(bombCount == 0 && isAlive) {
            const bomb = new Bomb(position = self.position(), owner = self)
            bomb.init()
            bombCount++
        }
        //todo Aca se podría implementar algún booster que permita poner más de una bomba
    }

    method harm() {
        self.isAlive(false) 
        self.die()
        
    }

	method image(direction){
		image = "./assets/characters/dino-" + direction.toString() + "-" + self.color() + ".png"
	}

	method action(direction){
		self.move(direction)
		self.image(direction)
	}
	
	method die(){  // An PC die 
		if(not(self.isAlive())) 
		game.schedule(phaseTime , {image = "./assets/characters/dino-lose.png"})
        game.schedule(phaseTime , {game.say(self, "ay")}) // No se visualiza el mensaje ya que lo bloquea los sprite de los muros 
		game.schedule(phaseTime * 2.5 , {game.removeVisual(self)})
		
		
		
		
	}

    method setup() {
        upBind.onPressDo({ self.action(up) })
        downBind.onPressDo({ self.action(down) })
        leftBind.onPressDo({ self.action(left) })
        rightBind.onPressDo({ self.action(right) })
        bombKey.onPressDo({ self.dropBomb() })
        
        game.addVisual(self)
    }  

    }
