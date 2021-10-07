import wollok.game.*
import level.*
import levels.*
import players.*

object menu {

    var selected = play
    const options = [play, keybindings, credits]
    var screenOnTop = null        //Example: credits or controls

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
    method goUp() {
        selected.isSelected(false)
        if(selected == keybindings) {
            selected = play
        }  else if(selected == credits) {
            selected = keybindings
        }
        selected.isSelected(true)
    }

    method goDown() {
        selected.isSelected(false)
        if(selected == play) {
            selected = keybindings
        } else if(selected == keybindings) {
            selected = credits
        }
        selected.isSelected(true)
    }

    method select() {
        if (selected.isSubMenu()) {
            screenOnTop = selected.subMenu()
            game.addVisual(screenOnTop)
        } else {
            selected.enter()
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
    position = game.at(3,5), 
    isSubMenu = false, 
    subMenu = null
    ) {

    method enter() {
        game.clear()        //Cleans the menu

        //TEMP
        const p1 = new Player(
                id = 1,
                color = "purple",
                position = game.at(1,15),
                upBind = keyboard.w(), 
                downBind = keyboard.s(), 
                leftBind = keyboard.a(), 
                rightBind = keyboard.d(),
                bombKey = keyboard.q()
            )

        const p2 = new Player(
            id = 2,
            color = "yellow",
            position = game.at(1,1),
            upBind = keyboard.up(), 
            downBind = keyboard.down(), 
            leftBind = keyboard.left(), 
            rightBind = keyboard.right(),
            bombKey = keyboard.minusKey()
        )

        const players = [p1, p2]
        //Fin TEMP
        
        players.forEach({_player => _player.setup()})
        
        levelSand.loadLevel()
    }
}

object keybindings inherits Button(
    name = "keybindings", 
    imgSelected = "./assets/menu/CONTROLES_rojo.png", 
    imgUnselected = "./assets/menu/CONTROLES_blanco.png", 
    isSelected = false, 
    position = game.at(3,3), 
    isSubMenu = true, 
    subMenu = keybindingsSubpage
    ) {
    method enter() {
        return new MenuSubpage(image = "")
    }
    
    
}

object credits inherits Button(
    name = "credits", 
    imgSelected = "./assets/menu/CREDITOS_rojo.png", 
    imgUnselected = "./assets/menu/CREDITOS_blanco.png", 
    isSelected = false, 
    position = game.at(3,1), 
    subMenu = creditsSubpage,
    isSubMenu = true
    ) {
    method get_page() {
        return new MenuSubpage(image = "")
    }
}

class MenuSubpage {
    const property image
    const property position = game.at(0,0)
}

const keybindingsSubpage = new MenuSubpage(image = "./assets/menu/controles.jpg")
const creditsSubpage = new MenuSubpage(image = "./assets/menu/creditos.jpg")