import wollok.game.*
import directions.*
import tile.*
import levels.* //temp
import bomb.*

//to-do Se deberia poder pasar por encima de otro dino
class Personaje {
    //Propiedades que deben ser asignadas al declarar un objeto
    const property id
    const upBind
    const downBind
    const leftBind
    const rightBind
    const bombKey
    var property bombCount = 0

    //Variables con valor inicial
    var property position = game.at(1,1) //TODO: Valor inicial temporal, luego ajustar. 
    var property isAlive = true
    const property canBeSteppedOn = true
    const property color
    var property image = "./assets/characters/dino-right-" + self.color() + ".png"

    method render() {
        game.addVisual(self)
    }

    method move(direction) {
        const nextPosition = direction.nextPosition(position)

        if(game.getObjectsIn(nextPosition).all({tile => tile.canBeSteppedOn()})) {
            position = nextPosition
        }
    }

    method dropBomb() {
		/* En caso de que tenga una bomba disponible para dropear
		 * if(!(bombCount == 0)) {
			const bomb = new Bomb(position = self.position(), owner = self)
            bomb.init()
		}*/
		
        if(bombCount == 0) {
            const bomb = new Bomb(position = self.position(), owner = self)
            bomb.init()
            bombCount++
        }
        //Aca se podría implementar algún booster que permita poner más de una bomba
    }

    method die() {
        //...
        isAlive = false
        game.removeVisual(self)
    }

	method color() = color

	method image(key){
		image = "./assets/characters/dino-" + key.toString() + "-" + self.color() + ".png"
	}

	method action(key){
		self.move(key)
		self.image(key)
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

//TODO: TEMP
object p1 inherits Personaje(
    id = 1,
    color = "purple",
    upBind = keyboard.w(), 
    downBind = keyboard.s(), 
    leftBind = keyboard.a(), 
    rightBind = keyboard.d(),
    bombKey = keyboard.q()
    ) {
}

object p2 inherits Personaje(
    id = 2,
    color = "yellow",
    upBind = keyboard.up(), 
    downBind = keyboard.down(), 
    leftBind = keyboard.left(), 
    rightBind = keyboard.right(),
    bombKey = keyboard.minusKey()
    ) {    
}