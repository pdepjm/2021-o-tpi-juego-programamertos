import wollok.game.*
import levels.*
import soundProducer.*
import directions.*
import tile.*
import players.*


class Level {
    //List that contains spawnpoints for all 4 characters
    const property spawnPoints = [game.at(1,15), game.at(1, 1), game.at(15, 15), game.at(1, 1)]
    const property solidTiles = []
    const property destroyableTiles = []

    method loadLevel() {

        /* A veces anda, a veces no
        keyboard.y().onPressDo({=>
            levelSand.unloadLevel()
            levelSand.loadLevel()
        })
        */
        
        self.changeBackground("./assets/map/bg-sand2.jpg") //TODO: TEMP a modo de prueba

        
        
    	self.renderSolidTiles()
    	self.renderDestroyableTiles()
        self.renderBorderTiles()

        
    }

    method unloadLevel() {
        solidTiles.forEach({_tile => _tile.remove()})
        destroyableTiles.forEach({_tile => _tile.remove()})
        
        //TODO: implementar logica jugadores
    }

	method renderSolidTiles()
	
	method renderDestroyableTiles()

	//same border tiles to every map, only thing that changes are images
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
        //Image must be 544x544
        background.image(image)
        if (!game.hasVisual(background)) {
            game.addVisual(background)
        }
    }
}

object background {
    const property position = game.at(0, 0)
    var property image = "./assets/menu/menu_background.png"
}


