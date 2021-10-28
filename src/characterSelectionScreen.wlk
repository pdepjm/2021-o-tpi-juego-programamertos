import wollok.game.*
import players.*
import levelManager.*
import menu.*

object characterSelectionScreen {
    var property confirmedCounter = 0 //Count of how many players confirmed their selection 

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
            self.startGame()
        }
    }


    method startGame() {
        
        game.schedule(1000 ,{
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

    method setUp() {
        if (playerId == 1) {
            //keyboard.a().onPressDo({self.previous()})     Wollok blows up
            keyboard.q().onPressDo({self.confirm()})
            keyboard.d().onPressDo({self.next()})
            
        } else if (playerId == 2) {
            //keyboard.left().onPressDo({self.previous()})
            keyboard.minusKey().onPressDo({self.confirm()})
            keyboard.right().onPressDo({self.next()})
        }
            game.addVisual(self)

    }

    method getCurrentlySelectedColor() = availableColors.get(currentlySelected)
    
    method image() {
        return "./assets/characters/dino-right-" + availableColors.get(currentlySelected) + ".png"
    }

    method next() {
        if(!hasConfirmed) {
            currentlySelected = (currentlySelected + 1) % availableColors.size()
        }
    }

    //Unused as it is unstable in current wollok build
    method previous() {
        currentlySelected = (currentlySelected - 1) % availableColors.size()
    }

    method position()  {
        if(playerId == 1) {
            return game.at(5, 8)
        } else if (playerId == 2) {
            return game.at(11, 8)
        } else {
            game.say(self, "ID Error in CharacterSelector")
            return game.at(-1, -1)
        }
    }

    method confirm() {
        if(!hasConfirmed) {
            hasConfirmed = true
            game.say(self, "Confirmado")
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