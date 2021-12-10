import wollok.game.*
import level.*
import levels.*
import players.*
import levelManager.*
import characterSelectionScreen.*
import soundManager.*

object menu {

    var property selected = 0
    const options = [play, keybindings, credits]
    var property screenOnTop = null        //Example: credits or controls

	method getSelected() = options.get(selected)

    method setup(){
        self.loadControls()
        game.boardGround("./assets/menu/menu-background.png")
        options.forEach({option => game.addVisual(option)})
        game.addVisual(title)

        //Play menu soundtrack
        game.schedule(1, {soundManager.playSong(new SoundEffect(path = './assets/sounds/menuST.mp3'), true)})
    }

    method loadControls() {
        keyboard.up().onPressDo({ self.goUp() })
        keyboard.down().onPressDo({ self.goDown() })
        keyboard.space().onPressDo({ self.select() })
        keyboard.q().onPressDo({self.exit() })
    }

    method goUp(){
    	self.getSelected().isSelected(false)
    	// Modulo hack to make the menu cyclic.
    	selected = (((selected - 1) % options.size()) + options.size()) % options.size()
    	self.getSelected().isSelected(true)
    }

    method goDown(){
    	self.getSelected().isSelected(false)
    	// Modulo hack to make the menu cyclic.
    	selected = (((selected + 1) % options.size()) + options.size()) % options.size()
    	self.getSelected().isSelected(true)
    }

    method select(){
		if (screenOnTop == null){
			screenOnTop = self.getSelected()
        	self.getSelected().enter()
		}
    }

    method exit(){
        if (screenOnTop != null) {
            screenOnTop.remove()
            screenOnTop = null
        }
    }
}

object title {
    const property position = game.at(2, 11)    
    const property image = "./assets/menu/DINOBOOM.png"                  
}

class Button {
    const property name
    const property position
    const imgSelected
    const imgUnselected
    var property isSelected

    method image() = if (isSelected) imgSelected else imgUnselected
}

object play inherits Button(
    name = "play", 
    imgSelected = "./assets/menu/JUGAR_rojo.png", 
    imgUnselected = "./assets/menu/JUGAR_blanco.png", 
    isSelected = true, 
    position = game.at(3,8)
    ) {

    method enter(){
        game.clear()
        characterSelectionScreen.setUp()
    }
    
    method remove(){}
}

object keybindings inherits Button(
    name = "keybindings", 
    imgSelected = "./assets/menu/CONTROLES_rojo.png", 
    imgUnselected = "./assets/menu/CONTROLES_blanco.png", 
    isSelected = false,
    position = game.at(3,6)
    ) {
    	
    method enter() {
        game.addVisual(keybindingsSubpage)
    }
    
    method remove(){
    	game.removeVisual(keybindingsSubpage)
    }
}

object credits inherits Button(
    name = "credits", 
    imgSelected = "./assets/menu/CREDITOS_rojo.png", 
    imgUnselected = "./assets/menu/CREDITOS_blanco.png", 
    isSelected = false, 
    position = game.at(3,4)
    ) {
    
    method enter(){
    	game.addVisual(creditsSubpage)
    }
    
    method remove(){
    	game.removeVisual(creditsSubpage)
    }
}

const keybindingsSubpage = new Screen(image = "./assets/menu/controles.png")
const creditsSubpage = new Screen(image = "./assets/menu/creditos.png")
