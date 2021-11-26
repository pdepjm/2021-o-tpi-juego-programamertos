import wollok.game.*
import levels.*
import players.*


class Screen {
    const property image
    const property position = game.at(0,0)
}

// This object manages the state of levels
object levelManager {
    const availableLevels = [levelDungeon, levelStone, levelSand]


    var playersAlive = [p1, p2]
    var property activeLevel = null
    var levelFinished
    var levelCounter = new Range(start = 0, end = 2).anyOne()

    method loadLevel(){
        activeLevel = availableLevels.get(levelCounter)
        activeLevel.loadLevel()   //More levels could be added by making changes here

        playersAlive = [p1, p2]

        const players = [p1, p2]
        players.forEach({_player => _player.spawn()})
        players.forEach({_player => _player.setup()})

        levelFinished = false
    }

    method finishLevel(player) {
        levelFinished = true
        const levelEndScreen = new Screen(image = "./assets/menu/youwin-" + player.id() + ".png")
        game.schedule(1500, {
            game.addVisual(levelEndScreen)
            game.removeVisual(player)
            activeLevel.unloadLevel()
        })
        game.schedule(3000, {
            game.removeVisual(levelEndScreen)
            game.clear()
            self.loadLevel()
        })
        levelCounter = (levelCounter + 1) % 3
    }

    method levelFinished() = levelFinished

    method playerDied(player) {
        playersAlive.remove(player)
        self.checkIfLevelFinished()
    }

    method checkIfLevelFinished() {
        if (playersAlive.size() == 1) {
            self.finishLevel(playersAlive.get(0))
        } else if (playersAlive.size() == 0) {
            self.finishLevel("neutral")    //TODO: Arreglar imagen neutral. Altamente improbable que dos jugadores mueran en el mismo tick.
        }
    }
}


const p1 = new Player(
        id = 1,
        color = "green",
        position = game.at(15,15),
        upBind = keyboard.w(), 
        downBind = keyboard.s(), 
        leftBind = keyboard.a(), 
        rightBind = keyboard.d(),
        useKey = keyboard.q()
    )

const p2 = new Player(
    id = 2,
    color = "red",
    position = game.at(1,1),
    upBind = keyboard.up(), 
    downBind = keyboard.down(), 
    leftBind = keyboard.left(), 
    rightBind = keyboard.right(),
    useKey = keyboard.minusKey()
)
