import wollok.game.*

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
    const property image =  "./assets/map/wall-sand.png"
    const property canBeSteppedOn = false
    const property destroyable = false

    //...
}

//DestroyableTile represents those tiles that can be destroyed by the player (Obstacles) and drop items
class DestroyableTile inherits Tile {
    const property image = "./assets/objects/obstacles/obstacle-sand-" + new Range(start = 1, end = 3).anyOne() + ".png" //TODO level changes obstacles
    var property canBeSteppedOn = false
    const property destroyable = true

    //The following method is called in bomb.wlk
    method harm() {
        game.removeVisual(self) 
        //canBeSteppedOn = true //TODO: Línea probablemente de más
        //TODO: Implementar bonus
    }

    //...
}

//BorderTile represents a SolidTile placed at the edge of the map
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const property image = "./assets/map/wall-sand.png"
    const property canBeSteppedOn = false
    const property destroyable = false
    //...
}