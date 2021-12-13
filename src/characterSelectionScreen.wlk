import wollok.game.*
import players.*
import levelManager.*
import menu.*
import soundManager.*

class ConfirmedIndicator {
    const image = "./assets/menu/confirmado.png"
    const property position

    method image() = image

    method show() {
        game.addVisual(self)
    }
}

object characterSelectionScreen {
	//Count of how many players confirmed their selection
    var property confirmedCounter = 0 

    const selector1 = new CharacterSelector(playerId = 1, currentlySelected = 0)
    const selector2 = new CharacterSelector(playerId = 2, currentlySelected = 1)

    method incrementConfirmedCounter() {
        confirmedCounter++
        self.checkAllPlayersReady()
    }

    method setUp() {
        // Set up the background
        characterSelectionScreenBackground.show()

        // Set up the character selection screen
        selector1.setUp()
        selector2.setUp()
    }

    method checkAllPlayersReady() {
        if (confirmedCounter == 2) {
            soundManager.playSong(new SoundEffect(path = './assets/sounds/gameST.mp3') , true)
            self.startGame()
        }
    }

    method startGame() {
        game.schedule(1000, {
            //Clear menu
            game.clear()    

            //Set player colors
            p1.color(selector1.getCurrentlySelectedColor())
            p2.color(selector2.getCurrentlySelectedColor())

            //Show loading screen
            loadingScreen.show()

            //Load level
            game.schedule(500 ,{levelManager.loadLevel()})  //This prevents the user from miss-inputs
        })
    }
}

class CharacterSelector {
    const playerId
    var property currentlySelected
    const availableColors = ["red", "green", "purple", "yellow"]
    var hasConfirmed = false

    method setUp(){
        if (playerId == 1) {
            keyboard.a().onPressDo({self.previous()})
            keyboard.q().onPressDo({self.confirm()})
            keyboard.d().onPressDo({self.next()})
            
        } else if (playerId == 2) {
            keyboard.left().onPressDo({self.previous()})
            keyboard.minusKey().onPressDo({self.confirm()})
            keyboard.right().onPressDo({self.next()})
        }
        
        game.addVisual(self)
    }

    method getCurrentlySelectedColor() = availableColors.get(currentlySelected)
    
    method image() = "./assets/characters/dino-right-" + availableColors.get(currentlySelected) + ".png"

    method next(){
        if(!hasConfirmed) {
        	// Modulo hack to make the colour selection cyclic.
            currentlySelected = (((currentlySelected + 1) % availableColors.size()) + availableColors.size()) % availableColors.size()
        }
    }

    method previous(){
    	// Modulo hack to make the colour selection cyclic.
    	currentlySelected = (((currentlySelected - 1) % availableColors.size()) + availableColors.size()) % availableColors.size()
    }

    method position() = if (playerId == 1) game.at(4,7) else game.at(8, 7)

    method confirm(){
        if(!hasConfirmed){
            hasConfirmed = true
            //game.say(self, "Confirmado")
            const confirmedText = new ConfirmedIndicator(position = self.position())
            confirmedText.show()
            characterSelectionScreen.incrementConfirmedCounter()
        }
    }
}

object loadingScreen {
    const image = "./assets/menu/loadingScreen.png"
    const property position = game.at(0,0)

    method image() = image

    method show() {
        game.addVisual(self)
    }
}

object characterSelectionScreenBackground {
    const image = "./assets/menu/selectionScreen.png"
    const property position = game.at(0,0)

    method image() = image

    method show() {
        game.addVisual(self)
    }
}