import wollok.game.*

class Tile {
    // property te hace el method getter y setter. Es epico.
    const property position

    method render() {
        game.addVisual(self)
    }
}

//SolidTile representa a aquellos cubos que no pueden ser atravesados
class SolidTile inherits Tile {
    const property image =  "./assets/map/solidTile.png"
    const property canBeSteppedOn = false

    //...
}

//DestroyableTile representa a aquellos tiles que pueden ser destruidos por el usuario (Obstáculos)
// y arrojar items
class DestroyableTile inherits Tile {
    const property image = "./assets/map/destroyableTile.png"
    var property canBeSteppedOn = false

    method destroy() {
        game.removeVisual(self) 
        canBeSteppedOn = true
    }

    //...
}

//BorderTile representa a un SolidTile que se encuentra en el borde del mapa
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const property image = "./assets/map/solidTile.png"
    const property canBeSteppedOn = false


    //...
}

//TEMP
object testTile inherits SolidTile(position = game.at(10, 10)) {
    
}