import tile.*
import wollok.game.*

class Level {
    //Lista que contiene los spawnpoints de los 4 personajes
    const property spawnPoints = [game.at(1,15), game.at(1, 1), game.at(15, 15), game.at(1, 1)]

    //Tiles
    const solidTiles
    const destroyableTiles

    method loadLevel() {
        solidTiles.forEach({tile => tile.render()})
        destroyableTiles.forEach({tile => tile.render()})
        self.renderBorderTiles()
    }

    method renderBorderTiles() {
        const rango = (0 .. 16)
        //Lado oeste
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 0))}).forEach({tile => tile.render()})
        //Lado este
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 16))}).forEach({tile => tile.render()})
        //Lado norte
        rango.map({yCoord => return new BorderTile(position = game.at(0, yCoord))}).forEach({tile => tile.render()})
        //Lado sur
        rango.map({yCoord => return new BorderTile(position = game.at(16, yCoord))}).forEach({tile => tile.render()})
        
    }

}



