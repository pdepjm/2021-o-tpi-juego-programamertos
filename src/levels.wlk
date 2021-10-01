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

	//TODO: gatos muertos
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

       new SolidTile(position = game.at(2, 12)),
       new SolidTile(position = game.at(3, 12)),
       new SolidTile(position = game.at(5, 12)),
       new SolidTile(position = game.at(7, 12)),
       new SolidTile(position = game.at(8, 12)),
       new SolidTile(position = game.at(9, 12)),
       new SolidTile(position = game.at(11, 12)),
       new SolidTile(position = game.at(13, 12)),
       new SolidTile(position = game.at(14, 12)),

       new SolidTile(position = game.at(11, 11)),
       new SolidTile(position = game.at(11, 11)),
       new SolidTile(position = game.at(5, 11)),

       new SolidTile(position = game.at(1, 10)),
       new SolidTile(position = game.at(3, 10)),
       new SolidTile(position = game.at(8, 10)),
       new SolidTile(position = game.at(13, 10)),
       new SolidTile(position = game.at(15, 10)),

	   new SolidTile(position = game.at(3, 9)),
	   new SolidTile(position = game.at(4, 9)),
	   new SolidTile(position = game.at(5, 9)),
	   new SolidTile(position = game.at(7, 9)),
	   new SolidTile(position = game.at(8, 9)),
	   new SolidTile(position = game.at(9, 9)),
	   new SolidTile(position = game.at(11, 9)),
	   new SolidTile(position = game.at(12, 9)),
	   new SolidTile(position = game.at(13, 9)),

	   new SolidTile(position = game.at(3, 7)),
	   new SolidTile(position = game.at(4, 7)),
	   new SolidTile(position = game.at(5, 7)),
	   new SolidTile(position = game.at(7, 7)),
	   new SolidTile(position = game.at(8, 7)),
	   new SolidTile(position = game.at(9, 7)),
	   new SolidTile(position = game.at(11, 7)),
	   new SolidTile(position = game.at(12, 7)),
	   new SolidTile(position = game.at(13, 7)),

	   new SolidTile(position = game.at(1, 6)),
       new SolidTile(position = game.at(3, 6)),
       new SolidTile(position = game.at(8, 6)),
       new SolidTile(position = game.at(13, 6)),
       new SolidTile(position = game.at(15, 6)),

       new SolidTile(position = game.at(11, 5)),
       new SolidTile(position = game.at(5, 5)),


       new SolidTile(position = game.at(2, 4)),
       new SolidTile(position = game.at(3, 4)),
       new SolidTile(position = game.at(5, 4)),
       new SolidTile(position = game.at(7, 4)),
       new SolidTile(position = game.at(8, 4)),
       new SolidTile(position = game.at(9, 4)),
       new SolidTile(position = game.at(11, 4)),
       new SolidTile(position = game.at(13, 4)),
       new SolidTile(position = game.at(14, 4)),
       
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

	//TODO: testing
    destroyableTiles = [
        new DestroyableTile(position = game.at(14, 8)),
        new DestroyableTile(position = game.at(14, 7)),
        new DestroyableTile(position = game.at(14, 6)),
        new DestroyableTile(position = game.at(8, 3)),
        new DestroyableTile(position = game.at(14, 3)),
        new DestroyableTile(position = game.at(14, 13)),
        new DestroyableTile(position = game.at(7, 13))
    ]
)
