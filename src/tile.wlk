import wollok.game.*

class Tile {
    // property te hace el method getter y setter. Es epico.
    const property position

    method render() {
        game.addVisual(self)
    }

    method harm() {} //TODO: asume que el tile no es destruible, por eso hay override en DestroyableTile. Debería poder tener un mejor formato
}

//SolidTile representa a aquellos cubos que no pueden ser atravesados
class SolidTile inherits Tile {
    const property image =  "./assets/map/wall-stone.png"
    const property canBeSteppedOn = false
    const property destroyable = false

    //...
}

//DestroyableTile representa a aquellos tiles que pueden ser destruidos por el usuario (Obstáculos)
// y arrojar items
class DestroyableTile inherits Tile {
    const property image = "./assets/objects/barrier-tree2.png"
    var property canBeSteppedOn = false
    const property destroyable = true

    //The following method is called in bomb.wlk
    override method harm() {
        game.removeVisual(self) 
        //canBeSteppedOn = true //TODO: Línea probablemente de más
        //TODO: Implementar bonus
    }

    //...
}

//BorderTile representa a un SolidTile que se encuentra en el borde del mapa
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const property image = "./assets/map/wall-stone.png"
    const property canBeSteppedOn = false
    const property destroyable = false
    //...
}