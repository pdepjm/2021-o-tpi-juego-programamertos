import wollok.game.*
import directions.*
import tile.*
import levels.* //temp

class Personaje {
    //Propiedades que deben ser asignadas al declarar un objeto
    const property id
    const upBind
    const downBind
    const leftBind
    const rightBind

    //Variables con valor inicial
    var property position = game.at(1,1) //TODO: Valor inicial temporal, luego ajustar. 
    var property isAlive = true
    const property canBeSteppedOn = false

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
        //...
    }

    method die() {
        //...
        isAlive = false
        game.removeVisual(self)
    }

    method setup() {
        upBind.onPressDo({ self.move(up) })
        downBind.onPressDo({ self.move(down) })
        leftBind.onPressDo({ self.move(left) })
        rightBind.onPressDo({ self.move(right) })
        game.addVisual(self)
    }
}

//TODO: TEMP
object p1 inherits Personaje(
    id = 1, 
    upBind = keyboard.w(), 
    downBind = keyboard.s(), 
    leftBind = keyboard.a(), 
    rightBind = keyboard.d()
    ) {

    const property image = "./assets/characters/p1.png"
    
    
}

object p2 inherits Personaje(
    id = 2, 
    upBind = keyboard.up(), 
    downBind = keyboard.down(), 
    leftBind = keyboard.left(), 
    rightBind = keyboard.right()
    ) {

    const property image = "./assets/characters/p2.png"
    
}