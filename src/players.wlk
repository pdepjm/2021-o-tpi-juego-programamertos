import wollok.game.*
import directions.*
import tile.*

class Personaje {
    const property id
    var property position = game.at(1, 1)
    var property isAlive = true

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
}

//TODO: TEMP
object p1 inherits Personaje(id = 1) {
    const property image = "./assets/characters/p1.png"
}