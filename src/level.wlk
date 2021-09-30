import tile.*
import wollok.game.*

class Level {
    //List that contains spawnpoints for all 4 characters
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
        //West side
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 0))}).forEach({tile => tile.render()})
        //East side
        rango.map({xCoord => return new BorderTile(position = game.at(xCoord, 16))}).forEach({tile => tile.render()})
        //North side
        rango.map({yCoord => return new BorderTile(position = game.at(0, yCoord))}).forEach({tile => tile.render()})
        //South side
        rango.map({yCoord => return new BorderTile(position = game.at(16, yCoord))}).forEach({tile => tile.render()})
        
    }

}



