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
       new SolidTile(position = game.at(8, 15)),
    	
       new SolidTile(position = game.at(2, 14)),
       new SolidTile(position = game.at(3, 14)),
       new SolidTile(position = game.at(5, 14)),
       new SolidTile(position = game.at(6, 14)),
       new SolidTile(position = game.at(8, 14)),
       new SolidTile(position = game.at(10, 14)),
       new SolidTile(position = game.at(11, 14)),
       new SolidTile(position = game.at(13, 14)),
       new SolidTile(position = game.at(14, 14)),
       
       new SolidTile(position = game.at(2, 2)),
       new SolidTile(position = game.at(3, 2)),
       new SolidTile(position = game.at(5, 2)),
       new SolidTile(position = game.at(6, 2)),
       new SolidTile(position = game.at(8, 2)),
       new SolidTile(position = game.at(10, 2)),
       new SolidTile(position = game.at(11, 2)),
       new SolidTile(position = game.at(13, 2)),
       new SolidTile(position = game.at(14, 2)),
       
       new SolidTile(position = game.at(8, 1))
       
    ],

    destroyableTiles = [
       new DestroyableTile(position = game.at(14, 8)),
       new DestroyableTile(position = game.at(8, 7))
    ]

)