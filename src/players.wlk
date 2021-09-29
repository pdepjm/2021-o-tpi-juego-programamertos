import wollok.game.*
import directions.*
import tile.*
import levels.* //todo temp
import bomb.*

class Personaje {
	//Properties that must be asigned declaring a player
    const property id
    const property color //purple, yellow, red, green
    var property position
    const upBind
    const downBind
    const leftBind
    const rightBind
    const bombKey

    //Properties with initial value
    var property image = "./assets/characters/dino-right-" + self.color() + ".png"
    var property isAlive = true
    const property canBeSteppedOn = true
    var property bombCount = 0 //amount of bombs the player has active

	method color() = color

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
        if(bombCount == 0) {
            const bomb = new Bomb(position = self.position(), owner = self)
            bomb.init()
            bombCount++
        }
        //todo Aca se podría implementar algún booster que permita poner más de una bomba
    }

    method die() {
        //...
        isAlive = false
        game.removeVisual(self)
    }

	method image(direction){
		image = "./assets/characters/dino-" + direction.toString() + "-" + self.color() + ".png"
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
        bombKey.onPressDo({ self.dropBomb() })
        
        game.addVisual(self)
    }
}

//TODO: TEMP
object p1 inherits Personaje(
    id = 1,
    color = "purple",
    position = game.at(1,15),
    upBind = keyboard.w(), 
    downBind = keyboard.s(), 
    leftBind = keyboard.a(), 
    rightBind = keyboard.d(),
    bombKey = keyboard.q()
    ){}

object p2 inherits Personaje(
    id = 2,
    color = "yellow",
    position = game.at(1,1),
    upBind = keyboard.up(), 
    downBind = keyboard.down(), 
    leftBind = keyboard.left(), 
    rightBind = keyboard.right(),
    bombKey = keyboard.minusKey()
    ){}