import wollok.game.*
import tile.*
import directions.*

//TODO: cuando explota una bomba y le pega en su rango de explosión a otra bomba, la hace explotar automaticamente
class Bomb {
	//TODO: Hay que emprolijar esto un poco
	var property image =  "./assets/objects/bomb.png"
	var property timer = 1 	  	//time it takes to explode --unused
	const phaseTime = 500			//Phase duration in miliseconds
	var property distance = 5 	//how far (in tiles) the explosion will reach
	var property position
	const property canBeSteppedOn = false
	const owner
	const property destroyable = true
	

	method init() {
		game.addVisual(self)
		self.phaser()
	}

	method explode(){
		//...

		//Creates one explosion object in each adjacent tile
		orientations.forEach({_orientation => 
			const exp = new Explosion(position = position, orientation = _orientation, remainingTiles = distance) 
			exp.set()
		})

		game.say(self, "kuchaw")
		owner.bombCount(owner.bombCount() - 1)
		game.removeVisual(self)

	}

	method phaser() {
		game.schedule(phaseTime, {=> self.updateImage("./assets/objects/bomb2.png")})
		game.schedule(phaseTime*2, {=> self.updateImage("./assets/objects/bomb3.png")})
		game.schedule(phaseTime*3, {=> self.explode()})
	}

	method updateImage(newImage) {
		image = newImage
	}
	
	method addDistance(){
		distance += 1
	}

	method harm() {
		//TODO: Implementar que al ser impactada por otra explosion, la bomba explote
	}
}



class Explosion {
	//Without initial value
	const property position
	const orientation
	var remainingTiles

	//With initial value
	const property image = "./assets/objects/bomb4.png"	//TODO: Change
	const property destroyable = false
	const expansionRate = 100							//constant used to control how fast the explosion expands

	method set() {
		game.addVisual(self)	//Adds explosion sprite

		//TODO: Posible optimización, se ejecuta getObjectsIn más de una vez para una misma posicion
		//Gets all objects in position, checks if they are destroyable, in which case they are "harmed"/damaged
		game.getObjectsIn(position)
			.forEach({_object => 
				if(_object.destroyable()) {
					_object.harm()
				}
			})

		if(remainingTiles > 0) {
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

	
}