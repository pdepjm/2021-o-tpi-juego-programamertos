import wollok.game.*

//TODO: cuando explota una bomba y le pega en su rango de explosión a otra bomba, la hace explotar automaticamente
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
		game.say(self, "kuchaw")
		
		game.schedule(500, {=> 
			game.removeVisual(self)	
		})
	}

	method phaser() {
		game.schedule(phaseTime, {=> self.updateImage("./assets/objects/bomb2.png")})
		game.schedule(phaseTime*2, {=> self.updateImage("./assets/objects/bomb3.png")})
		game.schedule(phaseTime*3, {=> self.updateImage("./assets/objects/bomb4.png")})
		game.schedule(phaseTime*4, {=> self.explode()})
	}

	method updateImage(newImage) {
		image = newImage
	}
	
	method addDistance(){
		distance += 1
	}
	
}
