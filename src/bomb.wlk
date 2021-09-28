import wollok.game.*

class Bomb {
	const property image =  "./assets/objects/bomb.png"
	var property timer = 5 	  //time it takes to explode
	var property distance = 1 //how many tiles will the explosion be
	var property position
	const property canBeSteppedOn = true

	method explode(){
		//...
	}
	
	//to-do como accederiamos a las bombas especificas de un jugador para modificar estos atributos?
	method reduceTime(){
		timer -= 0.5
	}
	
	method addDistance(){
		distance += 1
	}
	
}
