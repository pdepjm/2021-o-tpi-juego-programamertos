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
    const property image = //TODO: Agregar imagen
    const property canBeSteppedOn = false

    //...
}

//DestroyableTile representa a aquellos tiles que pueden ser destruidos por el usuario (Obstáculos)
// y arrojar items
class DestroyableTile inherits Tile {
    const property image = //TODO: Agregar Imagen
    var property canBeSteppedOn = false

    method destroy() {
        game.removeVisual(self) 
        canBeSteppedOn = true
    }

    //...
}

//BorderTile representa a un SolidTile que se encuentra en el borde del mapa
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const propery image = //TODO: Agregar Imagen
    const property canBeSteppedOn = false


    //...
}