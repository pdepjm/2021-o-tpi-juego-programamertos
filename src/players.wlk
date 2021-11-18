import wollok.game.*
import directions.*

import bomb.*
import levelManager.*

class Player {
	//Properties without initial value
    const property id
    var property color //purple, yellow, red, green
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

    method spawn() {
        position = levelManager.activeLevel().spawnPoints().get(id)
        image = "./assets/characters/dino-right-" + self.color() + ".png"
        isAlive = true
        bombCount = 0  //hace falta?
        game.addVisual(self)
    }

    method move(direction) {
        if (isAlive) {
            const nextPosition = direction.nextPosition(position)

            if(game.getObjectsIn(nextPosition).all({tile => tile.canBeSteppedOn()})) {
                position = nextPosition
            }
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
        self.die()
    }

	method image(direction){
        if(isAlive) {
		    image = "./assets/characters/dino-" + direction.toString() + "-" + self.color() + ".png"
        } else {
            //Avoids image being overwritten when player tries to move after dying
            image = "./assets/characters/dino-lose.png" 
        }
	}

	method action(direction){
		self.move(direction)
		self.image(direction)
	}
	
	method die(){  // A player dies 
		if(isAlive) {
            isAlive = false
            levelManager.playerDied(self)
            image = "./assets/characters/dino-lose.png" 
            game.schedule(phaseTime * 2.5 , {game.removeVisual(self)})
        }
        
        
    }
	

    method setup() {
        upBind.onPressDo({ self.action(up) })
        downBind.onPressDo({ self.action(down) })
        leftBind.onPressDo({ self.action(left) })
        rightBind.onPressDo({ self.action(right) })
        bombKey.onPressDo({ self.dropBomb() })
    }  

}
