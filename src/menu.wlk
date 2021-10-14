import wollok.game.*
import level.*
import levels.*
import players.*

object menu {

    var selected = 0
    const options = [play, keybindings, credits]
    var screenOnTop = null        //Example: credits or controls

	method getSelected() = options.get(selected)

    method setup() {
        self.loadControls()
        game.boardGround("./assets/menu/menu_background.png")
        options.forEach({option => game.addVisual(option)})
        game.addVisual(title)
        
    }

    method loadControls() {
        keyboard.up().onPressDo({ self.goUp() })
        keyboard.down().onPressDo({ self.goDown() })
        keyboard.space().onPressDo({ self.select() })
        keyboard.q().onPressDo({self.exit() })
    }

    //TODO: Estas funciones podrian tener mejor lógica
    method goUp(){
    	self.getSelected().isSelected(false)
    	selected = (selected - 1).max(0)
    	self.getSelected().isSelected(true)
    }
    
    method goDown(){
    	self.getSelected().isSelected(false)
    	selected = (selected + 1).min(options.size() - 1)
    	self.getSelected().isSelected(true)
    }

    method select() {
        if (self.getSelected().isSubMenu()) {
            screenOnTop = self.getSelected().subMenu()

            if(!game.hasVisual(screenOnTop)){
                //TODO: Falta evitar que el usuario pueda acceder a otros submenús mientras se encuentre en otro
                game.addVisual(screenOnTop)
            }
        } else {
            self.getSelected().enter()
        }
    }

    method exit() {
        if (screenOnTop != null) {
            game.removeVisual(screenOnTop)
            screenOnTop = null
        }
    }
}

object title {
    const property position = game.at(1, 12)    //TODO: Cambiar según sea necesario
    const property image = "./assets/menu/DINOBOOM.png"                   //TODO: Agregar
}

class Button {
    const property name         //Identifier
    const property position
    const imgSelected           //Image shown when the option is selected
    const imgUnselected         //The opposite xd
    var property isSelected     //Boolean value indicating if the option is being selected by default
    const property isSubMenu
    const property subMenu

    method image() {
        if (isSelected) {
            return imgSelected
        }
        else {
            return imgUnselected
        }
    }

}

object play inherits Button(
    name = "play", 
    imgSelected = "./assets/menu/JUGAR_rojo.png", 
    imgUnselected = "./assets/menu/JUGAR_blanco.png", 
    isSelected = true, 
    position = game.at(3,8), 
    isSubMenu = false, 
    subMenu = null
    ) {

    method enter() {
        game.clear()        //Cleans the menu
        
        levelSand.loadLevel()
    }
}

object keybindings inherits Button(
    name = "keybindings", 
    imgSelected = "./assets/menu/CONTROLES_rojo.png", 
    imgUnselected = "./assets/menu/CONTROLES_blanco.png", 
    isSelected = false, 
    position = game.at(3,6), 
    isSubMenu = true, 
    subMenu = keybindingsSubpage
    ) {
    method enter() {
        return new Screen(image = "")
    }
    
    
}

object credits inherits Button(
    name = "credits", 
    imgSelected = "./assets/menu/CREDITOS_rojo.png", 
    imgUnselected = "./assets/menu/CREDITOS_blanco.png", 
    isSelected = false, 
    position = game.at(3,4), 
    subMenu = creditsSubpage,
    isSubMenu = true
    ) {
    method get_page() {
        return new Screen(image = "")
    }
}

class Screen {
    const property image
    const property position = game.at(0,0)
}

const keybindingsSubpage = new Screen(image = "./assets/menu/controles.png")
const creditsSubpage = new Screen(image = "./assets/menu/creditos.png")