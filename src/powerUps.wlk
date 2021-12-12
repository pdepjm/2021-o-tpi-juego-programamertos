import wollok.game.*
import tile.*
import players.*
import bomb.*

//Normal bomb
object normalBomb {
	method use(position, owner) {
		if(owner.bombCount() < owner.activeBombs()) { //if the player has bombs available
            const newBomb = new Bomb(owner = owner, position = position)
            newBomb.init()
            owner.bombCount(owner.bombCount() + 1)
        }
	}
}

//Throwable Bomb
class ThrowableBomb {
    var property position
    const property owner
    const property image = "./assets/objects/bomb/bomb.png"
    const direction
    var tilesTraveled = 0
    const rollSpeed = 50
    const property canBeSteppedOn = true

    method throwBomb(){            
        game.addVisual(self)
        self.roll()
    }

    method roll(){
        //Checks if next tile can be rolled on
        const canContinue = game.getObjectsIn(direction.nextPosition(position)).all({_object => _object.canBeSteppedOn()})
        if(canContinue){
            game.schedule((tilesTraveled + 1) * rollSpeed, {
                tilesTraveled++
                position = direction.nextPosition(position)
                self.roll()
            })
        } else{
            game.schedule(tilesTraveled * rollSpeed, {
            game.removeVisual(self)
            const bomb = new Bomb(position = position, owner = owner)
            bomb.init()
            })
        }
    }
}

object throwableBombItem {
    method use(position, owner) {

        //Checks if next tile (skipping one) in facing direction is clear
        const direction = owner.facingDirection()
        const startingPosition = direction.nextPosition(direction.nextPosition(position))

        //Gets objects in said tile
        const tileObjects = game.getObjectsIn(startingPosition)

        //Prevents the player from throwing more bombs
        owner.bombCount(owner.bombCount() + 1)

		var tbomb = ""

        //Performs the check
        if(tileObjects.all({_object => _object.canBeSteppedOn()})) {
            //Instantiates the bomb            
            tbomb = new ThrowableBomb(position = startingPosition, owner = owner, direction = direction)

        //If not possible, the bomb is in the player position
        } else {
            //Instantiates the bomb            
            tbomb = new ThrowableBomb(position = position, owner = owner, direction = direction)
        }

        //Rolls the bomb
        tbomb.throwBomb()

		//Player has no longer throwable bomb
		owner.activeItem(normalBomb)
    }
}

object throwableBombPickable {
	const property name = "throwableBomb"

	method effect(player) {
		player.activeItem(throwableBombItem)
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
    method pickUp(){
    	game.onCollideDo(self, { player =>    		
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