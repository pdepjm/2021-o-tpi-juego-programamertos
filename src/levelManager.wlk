import wollok.game.*
import levels.*
import players.*


class Screen {
    const property image
    const property position = game.at(0,0)
}

// This object manages the state of levels
object levelManager {
    var playersAlive = [p1, p2]
    var property activeLevel = null

    method loadLevel(){
        //TEMP
        levelSand.loadLevel()   //TODO: arreglar al agregar más niveles 
        activeLevel = levelSand
        //FIN TEMP

        playersAlive = [p1, p2]

        //TEMP


        const players = [p1, p2]
        players.forEach({_player => _player.spawn()})
        players.forEach({_player => _player.setup()})
        //Fin TEMP
    }

    //TODO: Problema grave, se solapan los tiles destruibles entre niveles
    method finishLevel(color) {
        const levelEndScreen = new Screen(image = "./assets/menu/youwin-" + color + ".png")
        game.schedule(5000, {game.addVisual(levelEndScreen)})
        game.schedule(7000, {
            game.removeVisual(levelEndScreen)
            activeLevel.unloadLevel()
            game.clear()
            self.loadLevel()
        })
    }

    method playerDied(player) {
        playersAlive.remove(player)
        self.checkIfLevelFinished()
    }

    method checkIfLevelFinished() {
        if (playersAlive.size() == 1) {
            self.finishLevel(playersAlive.get(0).color())
        } else if (playersAlive.size() == 0) {
            self.finishLevel("neutral")    //TODO: Arreglar imagen neutral
        }
    }
}

//TODO: Los jugadores deberían estar en algun lugar implementados de tal forma que sea facil "reiniciarlos"
const p1 = new Player(
        id = 1,
        color = "green",
        position = game.at(15,15),
        upBind = keyboard.w(), 
        downBind = keyboard.s(), 
        leftBind = keyboard.a(), 
        rightBind = keyboard.d(),
        bombKey = keyboard.q()
    )

const p2 = new Player(
    id = 2,
    color = "red",
    position = game.at(1,1),
    upBind = keyboard.up(), 
    downBind = keyboard.down(), 
    leftBind = keyboard.left(), 
    rightBind = keyboard.right(),
    bombKey = keyboard.minusKey()
)