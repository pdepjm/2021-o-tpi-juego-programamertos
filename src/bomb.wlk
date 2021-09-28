import wollok.game.*

object bomb {
	const property image =  "./assets/objects/bomb.png"
	var property timer = 5 	  //time it takes to explode
	var property distance = 1 //how many tiles will the explosion be
	
	method position() = game.at(10, 10)
	
	method explode(){
		//...
	}
	
	method reduceTime(){
		timer -= 0.5
	}
	
	method addDistance(){
		distance += 1
	}
	
}
