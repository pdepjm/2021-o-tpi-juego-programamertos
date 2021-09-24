import wollok.game.*
import directions.*

class Personaje {
    var property position
    var property isAlive

    method render() {
        game.addVisual(self)
    }

    method move(direction) {
        nextPosition = direction.nextPosition(position)

        if(game.getObjectsIn(nextPostion).all(canBeSteppedOn)) {
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