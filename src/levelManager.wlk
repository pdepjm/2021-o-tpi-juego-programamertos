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

    method levelFinished() = levelFinished

    method playerDied(player) {
        playersAlive.remove(player)
        self.finishLevel()
	}
	
	method finishLevel() {
    	levelFinished = true

		var levelEndScreen = ""
				
    	if(playersAlive.size() == 1){
			levelEndScreen = new Screen(image = "./assets/menu/youwin-" + playersAlive.get(0).id() + ".png")
		}else{
			levelEndScreen = new Screen(image = "./assets/menu/youwin-neutral.png")
		}
		
		game.schedule(1500, {
        game.addVisual(levelEndScreen)
        
        if(playersAlive.size() == 1){
       		game.removeVisual(playersAlive.get(0))
        }
        
        activeLevel.unloadLevel()
		})
	    
    	game.schedule(2000, {
        game.removeVisual(levelEndScreen)
        game.clear()
        self.loadLevel()
    	})
		
    	levelCounter = (levelCounter + 1) % 3
    }
}

