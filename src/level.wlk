import wollok.game.*
import levels.*
import soundProducer.*
import directions.*
import tile.*
import players.*


class Level {
    var property spawnPoints = []
    const property solidTiles = []
    const property destroyableTiles = []

    method levelName() = ""

    method loadLevel(){
        self.newSpawnPoints()
        
        self.changeBackground("./assets/map/bg-" + self.levelName() + ".png")    

    	self.renderSolidTiles()
    	self.renderDestroyableTiles()
        self.renderBorderTiles()
    }

    method unloadLevel(){
        solidTiles.forEach({_tile => _tile.remove()})
        destroyableTiles.forEach({_tile => _tile.remove()})
    }

	method renderSolidTiles()
	
	method renderDestroyableTiles()

    method renderBorderTiles() {
    	const ancho = game.width() - 1
		const largo = game.height() - 1
        
        //West side
        (1 .. ancho-1).map({xCoord => return new BorderTile(position = game.at(xCoord, 0))}).forEach({tile => tile.render()})
        //East side
        (1 .. ancho-1).map({xCoord => return new BorderTile(position = game.at(xCoord, ancho))}).forEach({tile => tile.render()})
        //North side
        (0 .. largo).map({yCoord => return new BorderTile(position = game.at(0, yCoord))}).forEach({tile => tile.render()})
        //South side
        (0 .. largo).map({yCoord => return new BorderTile(position = game.at(largo, yCoord))}).forEach({tile => tile.render()})
    }

    method changeBackground(image){
        //Image must be 13x64 => 832x832
        background.image(image)
        
        if (!game.hasVisual(background)) {
            game.addVisual(background)
        }
    }

    method newSpawnPoints()
}

object background {
    const property position = game.at(0, 0)
    var property image = "./assets/menu/menu_background.png"
}

