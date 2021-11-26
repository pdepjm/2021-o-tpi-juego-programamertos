import wollok.game.*
import levelManager.*
import powerUps.*

class Tile {
    // property te hace el method getter y setter. Es epico. Epicardo.
    const property position
    const property stopsExplosion = true     //An explosion won't expand after colliding with a tile

    method render() {        
        game.addVisual(self)
    }

    method remove() {
        if(game.hasVisual(self)){
            game.removeVisual(self)
        }
    }

    //method harm() {} //TODO: asume que el tile no es destruible, por eso hay override en DestroyableTile.
    					//Debería poder tener un mejor formato
}

//SolidTile represents those tiles that can't be stepped on
class SolidTile inherits Tile {
    const property image =  "./assets/map/wall-" + levelManager.activeLevel().levelName() + ".png"
    const property canBeSteppedOn = false
    const property destroyable = false

    //...
}

//DestroyableTile represents those tiles that can be destroyed by the player (Obstacles)
class DestroyableTile inherits Tile {
    var property image = "./assets/objects/obstacles/obstacle-" + levelManager.activeLevel().levelName() + "-" + new Range(start = 1, end = 3).anyOne() + ".png" //TODO level changes obstacles
    var property canBeSteppedOn = false
    const property destroyable = true

    //The following method is called in bomb.wlk
    method harm() {
        game.removeVisual(self)
        //canBeSteppedOn = true //TODO: Línea probablemente de más
        
        // dropping a powerUp item
        const random = new Range(start = 0, end = 3).anyOne()
        const type = [bomb, distance, speed]
                	
        if(random == 1){
        	const bonus = new PowerUp(position = self.position(), type = type.anyOne())
        	bonus.render()
        	bonus.affect()
        }
    }

    override method render() {
        const objectsInPosition = game.getObjectsIn(position)
        objectsInPosition.forEach({_object => game.removeVisual(_object)})
        super()
    }

    //...
}

//BorderTile represents a SolidTile placed at the edge of the map
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const property image = "./assets/map/wall-" + levelManager.activeLevel().levelName() + ".png"
    const property canBeSteppedOn = false
    const property destroyable = false
    //...
}
