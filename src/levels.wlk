import wollok.game.*
import tile.*
import level.*

const level1 = new Level(
    spawnPoints = [
        game.at(1, 1),
        game.at(17, 1),
        game.at(1, 17),
        game.at(17, 17)
    ],

    solidTiles = [
       new SolidTile(position = game.at(10, 10))
    ],

    destroyableTiles = [
        
    ]

)