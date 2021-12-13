import wollok.game.*
import tile.*
import directions.*
import levelManager.*

class Bomb {	
	const owner
	var property image =  "./assets/objects/bomb/bomb.png"	
	var property position
	var property speed = owner.bombSpeed()
	var property distance = owner.bombDistance()
	
	const property canBeSteppedOn = false
	const property destroyable = true
	const property stopsExplosion = false
	var exploded = false

	method init() {
		game.addVisual(self)
		self.phaser()
	}

	method explode(){
		if(!exploded){
			exploded = true

			//Creates one explosion object in each adjacent tile
			orientations.forEach({_orientation => 
				const exp = new Explosion(position = position, orientation = _orientation, remainingTiles = distance) 
				exp.set()
			})

			owner.bombCount(owner.bombCount() - 1)
			game.removeVisual(self)
		}
	}

	method phaser() {
		game.schedule(speed, {=> self.updateImage("./assets/objects/bomb/bomb2.png")})
		game.schedule(speed * 2, {=> self.updateImage("./assets/objects/bomb/bomb3.png")})
		game.schedule(speed * 3, {=> if(!levelManager.levelFinished()) self.explode()})
	}

	method updateImage(newImage) {
		image = newImage
	}

	method harm() {
		self.explode()
	}
}


class Explosion {
	//Without initial value
	const property position
	const orientation
	var remainingTiles

	//With initial value
	const property image = "./assets/objects/bomb/bomb4.png"
	const property destroyable = false
	const expansionRate = 100							//constant used to control how fast the explosion expands
	const property canBeSteppedOn = false				
	const property stopsExplosion = false

	method set() {
		game.addVisual(self)	//Adds explosion sprite

		//Gets all objects in position,
		const objectsinPosition = game.getObjectsIn(position)
		var ableToContinueExpansion = true

		//Checks if they are destroyable, in which case they are "harmed"/damaged
		objectsinPosition.forEach({_object => 
				if(_object.destroyable()) {
					_object.harm()

					//Checks if the object stops the explosion from expanding beyond it.
					ableToContinueExpansion = !_object.stopsExplosion() && ableToContinueExpansion
				}
			})

		if(remainingTiles > 0 && ableToContinueExpansion) {
			//Saves next tile in a variable, as it is used more than once
			const nextPosition = orientation.nextPosition(position)

			//Fetches objects in next position
			const objectsInNextPosition = game.getObjectsIn(nextPosition)

			//Checks if next tile is destroyable or free
			if(self.shouldReachNextTile(objectsInNextPosition)) {
				//Expands Explosion to next tile
				game.schedule(expansionRate, {=> self.expand(nextPosition)})
			}
		}

		//The sprite is scheduled to be removed once it reaches its full distance
		game.schedule((remainingTiles + 2) * expansionRate, {=> game.removeVisual(self)})
	}

	method shouldReachNextTile(objectsInNextPosition) {
		//First part checks if there are no objects in next tile
		//Last part checks if elements in following tile are non destroyable
		return objectsInNextPosition.isEmpty() || objectsInNextPosition.all({_object => _object.destroyable()})
	}

	//Creates an Explosion object for the following tile
	method expand(nextPosition) {
		const exp = new Explosion(position = nextPosition, orientation = orientation, remainingTiles = remainingTiles - 1)
		exp.set()
	}
	
	method isAPlayer() = false
}

