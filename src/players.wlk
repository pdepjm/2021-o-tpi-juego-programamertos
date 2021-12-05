import wollok.game.*
import directions.*
import bomb.*
import levelManager.*
import powerUps.*

class Player {
	
	//Properties without initial value
    const property id
    var property color //purple, yellow, red, green
    var property position
    
    //keys
    const upBind
    const downBind
    const leftBind
    const rightBind
    const useKey
    
    //Properties with initial value
    var property image = "./assets/characters/dino-right-" + self.color() + ".png"
    var property isAlive = true
    const property canBeSteppedOn = true
    const property destroyable = true   	//This property is used by the bomb explosion
    const property stopsExplosion = false 	//An explosion will continue expanding after hitting a player
    var property bombCount = 0				//Amount of bombs the player has active on field
    var property facingDirection = right    //Used to aim throwable bomb
    var property defenseStatus = normalDefenseStatus //Used to determine how the player reacts to damage
    
    //bonus implementation
    var property activeBombs = 1					//Amount of bombs the player has in total (it goes up with +1 bonus)
    var property bombDistance = 2			//Distance of player bomb explosions (it goes up with extraDistance bonus)
	var property bombSpeed = 500			//Speed at which bombs explode (it goes up with extraSpeed bonus)
    var property activeItem = normalBomb
       
	method color() = color

    method spawn() {
        position = levelManager.activeLevel().spawnPoints().get(id)
        image = "./assets/characters/dino-right-" + self.color() + ".png"
        isAlive = true
        bombCount = 0  //hace falta?

        //Bonus reset
        activeBombs = 1
        bombDistance = 2
        bombSpeed = 500
        activeItem = normalBomb

        game.addVisual(self)
    }

    method move(direction) {
        if (isAlive) {
            const nextPosition = direction.nextPosition(position)

            if(game.getObjectsIn(nextPosition).all({tile => tile.canBeSteppedOn()})) {
                position = nextPosition
            }
            facingDirection = direction
        }
    }

    method useItem() {	
        if(isAlive) {
            activeItem.use(position, self)
        }	
    }

    method harm() {
        defenseStatus.affect(self)
    }

	method die(){
        isAlive = false
        levelManager.playerDied(self)
        image = "./assets/characters/dino-lose.png" 
        game.schedule(500 * 2.5 , {game.removeVisual(self)})
        defenseStatus = deadStatus        
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
	
    method setup() {
        upBind.onPressDo({ self.action(up) })
        downBind.onPressDo({ self.action(down) })
        leftBind.onPressDo({ self.action(left) })
        rightBind.onPressDo({ self.action(right) })
        useKey.onPressDo({ self.useItem() })
    }
    
    method bonusBomb(){
    	activeBombs = activeBombs + 1
    }
    
    method bonusDistance(){
    	bombDistance = bombDistance + 1
    }
    
    method bonusSpeed(){
    	bombSpeed = bombSpeed - 50
    }
    
    method isAPlayer() = true
}

object normalDefenseStatus {
    method affect(player) {
        player.die()
    }
}

object deadStatus {
    method affect(player) {}
}
