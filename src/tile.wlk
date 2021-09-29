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
    const property image =  "./assets/map/wall-stone.png"
    const property canBeSteppedOn = false

    //...
}

//DestroyableTile representa a aquellos tiles que pueden ser destruidos por el usuario (Obstáculos)
// y arrojar items
class DestroyableTile inherits Tile {
    const property image = "./assets/objects/barrier-tree2.png"
    var property canBeSteppedOn = false

    method destroy() {
        game.removeVisual(self) 
        canBeSteppedOn = true
    }

    //...
}

//BorderTile representa a un SolidTile que se encuentra en el borde del mapa
class BorderTile inherits Tile {    //Considerar heredar desde SolidTile
    const property image = "./assets/map/wall-stone.png"
    const property canBeSteppedOn = false

    /*
    method render() {
        //TODO: Poner todo en un bloque
        const rango = (1 .. 17)
        //Lado oeste
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 1))}).forEach({tile => tile.render()})
        //Lado este
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 17))}).forEach({tile => tile.render()})
        //Lado norte
        rango.map({yCoord => return new BorderTile(position = game.at(1, yCoord))}).forEach({tile => tile.render()})
        //Lado sur
        rango.map({yCoord => return new BorderTile(position = game.at(17, yCoord))}).forEach({tile => tile.render()})
        
    }
    */
    //...
}