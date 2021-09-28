import wollok.game.*

class Bomb {
	var property image =  "./assets/objects/bomb.png"
	var property timer = 1 	  	//time it takes to explode --unused
	var phaseTime = 500			//Phase duration in miliseconds
	var property distance = 1 	//how far (in tiles) the explosion will reach
	var property position
	const property canBeSteppedOn = false

	method init() {
		game.addVisual(self)
		self.phaser()
	}

	method explode(){
		//...
		game.say(self, "BOOM (Imaginar fuego)")
		
		game.schedule(500, {=> 
			position(game.at(17,17))
			game.removeVisual(self)	
		})	//TODO: Como borrar? Se podrá siquiera? Y la moto?
	}

	method phaser() {
		/*	//TODO: Implementar imagenes
		game.schedule(phaseTime, {=> self.updateImage("./assets/objects/bomb1.png")})
		game.schedule(phaseTime*2, {=> self.updateImage("./assets/objects/bomb2.png")})
		game.schedule(phaseTime*3, {=> self.updateImage("./assets/objects/bomb3.png")})
		*/
		game.schedule(phaseTime*4, {=> self.explode()})
	}

	method updateImage() {

	}
	
	method addDistance(){
		distance += 1
	}
	
}
