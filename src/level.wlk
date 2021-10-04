import wollok.game.*
import levels.*
import soundProducer.*
import directions.*
import tile.*
import obstacles.*
import bomb.*
import players.*


class Level {
    //List that contains spawnpoints for all 4 characters
    const property spawnPoints = [game.at(1,15), game.at(1, 1), game.at(15, 15), game.at(1, 1)]
    const solidTiles
    const destroyableTiles

    method loadLevel() {
    	self.renderSolidTiles()
    	self.renderDestroyableTiles()
        self.renderBorderTiles()

        
    }

    method unloadLevel() {
        solidTiles.forEach({_tile => _tile.remove()})
        destroyableTiles.forEach({_tile => _tile.remove()})
        //TODO: implementar logica jugadores
    }

	method renderSolidTiles(){
		solidTiles.forEach({tile => tile.render()})
	}
	
	method renderDestroyableTiles(){
		destroyableTiles.forEach({tile => tile.render()})
	}

    method renderBorderTiles() {
    	const ancho = game.width() - 1
		const largo = game.height() - 1
        
        //West side
        (1 .. ancho-1).map({xCoord => return new BorderTile(position = game.at(xCoord, 0))}).forEach({tile => tile.render()})
        //East side
        (1 .. ancho-1).map({xCoord => return new BorderTile(position = game.at(xCoord, 16))}).forEach({tile => tile.render()})
        //North side
        (0 .. largo).map({yCoord => return new BorderTile(position = game.at(0, yCoord))}).forEach({tile => tile.render()})
        //South side
        (0 .. largo).map({yCoord => return new BorderTile(position = game.at(16, yCoord))}).forEach({tile => tile.render()})
    }
}



