import wollok.game.*
import tile.*
import level.*


/*
//testing to refactorize
object levelOne inherits Level{
	
	override method createSolidTiles(){
	
	// Para repetir codigo solo una vez por fila (80 líneas se convierten en 30)
	// Esta implementación requeriría un método en la clase nivel que cree sus tiles
	// Todo esto es solo para las SolidTiles
	
	const pos1 = [8] //(15, 1)
	const pos2 = [2, 3, 5, 6, 8, 10, 11, 13, 14] //(14, 2)
	const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14] //(12, 4)
	const pos4 = [5, 11] //(11, 5)
	const pos5 = [1, 3, 8, 13, 15] //(10, 6)
	const pos6 = [3, 4, 5, 7, 8, 9, 11, 12, 13] //(9, 7)
	
	const posiciones = [pos1, pos2, pos3, pos4, pos5, pos6] // Podríamos hacer un loop de esta lista tambien
	 															// Pero no sabría como implementar el número de fila

	pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 15)) )} )
	pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 1)) )} )
	
	pos2.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 14)) )} )
	pos2.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 2)) )} )
	
	pos3.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 12)) )} )
	pos3.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 4)) )} )
	
	pos4.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 11)) )} )
	pos4.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 5)) )} )
	
	pos5.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 10)) )} )
	pos5.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 6)) )} )
	
	pos6.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 9)) )} )
	pos6.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 7)) )} )
	}
	
	method createDestroyableTiles(){
		
	}
}
*/

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

    destroyableTiles = [
        new DestroyableTile(position = game.at(4, 15)),
        new DestroyableTile(position = game.at(5, 15)),
        new DestroyableTile(position = game.at(6, 15)),
        new DestroyableTile(position = game.at(7, 15)),
        new DestroyableTile(position = game.at(9, 15)),
        new DestroyableTile(position = game.at(10, 15)),
        new DestroyableTile(position = game.at(11, 15)),
        new DestroyableTile(position = game.at(12, 15)),
 
        new DestroyableTile(position = game.at(4, 14)),
        new DestroyableTile(position = game.at(7, 14)),
        new DestroyableTile(position = game.at(9, 14)),
        new DestroyableTile(position = game.at(12, 14)),
    	
    	new DestroyableTile(position = game.at(2, 13)),
        new DestroyableTile(position = game.at(3, 13)),
        new DestroyableTile(position = game.at(5, 13)),
        new DestroyableTile(position = game.at(7, 13)),
        new DestroyableTile(position = game.at(8, 13)),
        new DestroyableTile(position = game.at(9, 13)),
        new DestroyableTile(position = game.at(11, 13)),
        new DestroyableTile(position = game.at(13, 13)),
        new DestroyableTile(position = game.at(14, 13)),
    	
        new DestroyableTile(position = game.at(1, 12)),
        new DestroyableTile(position = game.at(4, 12)),
        new DestroyableTile(position = game.at(6, 12)),
        new DestroyableTile(position = game.at(10, 12)),
        new DestroyableTile(position = game.at(12, 12)),
        
        new DestroyableTile(position = game.at(1, 11)),
        new DestroyableTile(position = game.at(3, 11)),
        new DestroyableTile(position = game.at(4, 11)),
        new DestroyableTile(position = game.at(8, 11)),
        new DestroyableTile(position = game.at(12, 11)),
        new DestroyableTile(position = game.at(13, 11)),
        new DestroyableTile(position = game.at(15, 11)),
        
        new DestroyableTile(position = game.at(2, 10)),
        new DestroyableTile(position = game.at(5, 10)),
        new DestroyableTile(position = game.at(6, 10)),
        new DestroyableTile(position = game.at(10, 10)),
        new DestroyableTile(position = game.at(11, 10)),
        new DestroyableTile(position = game.at(14, 10)),
        
        new DestroyableTile(position = game.at(1, 8)),
        new DestroyableTile(position = game.at(3, 8)),
        new DestroyableTile(position = game.at(5, 8)),
        new DestroyableTile(position = game.at(8, 8)),
        new DestroyableTile(position = game.at(11, 8)),
        new DestroyableTile(position = game.at(13, 8)),
        new DestroyableTile(position = game.at(15, 8)),
        
        new DestroyableTile(position = game.at(2, 6)),
        new DestroyableTile(position = game.at(5, 6)),
        new DestroyableTile(position = game.at(6, 6)),
        new DestroyableTile(position = game.at(10, 6)),
        new DestroyableTile(position = game.at(11, 6)),
        new DestroyableTile(position = game.at(14, 6)),
        
        new DestroyableTile(position = game.at(1, 5)),
        new DestroyableTile(position = game.at(3, 5)),
        new DestroyableTile(position = game.at(4, 5)),
        new DestroyableTile(position = game.at(8, 5)),
        new DestroyableTile(position = game.at(12, 5)),
        new DestroyableTile(position = game.at(13, 5)),
        new DestroyableTile(position = game.at(15, 5)),
        
        new DestroyableTile(position = game.at(1, 4)),
        new DestroyableTile(position = game.at(4, 4)),
        new DestroyableTile(position = game.at(6, 4)),
        new DestroyableTile(position = game.at(10, 4)),
        new DestroyableTile(position = game.at(12, 4)),
        
        new DestroyableTile(position = game.at(2, 3)),
        new DestroyableTile(position = game.at(3, 3)),
        new DestroyableTile(position = game.at(5, 3)),
        new DestroyableTile(position = game.at(7, 3)),
        new DestroyableTile(position = game.at(8, 3)),
        new DestroyableTile(position = game.at(9, 3)),
        new DestroyableTile(position = game.at(11, 3)),
        new DestroyableTile(position = game.at(13, 3)),
        new DestroyableTile(position = game.at(14, 3)),
        
        new DestroyableTile(position = game.at(4, 2)),
        new DestroyableTile(position = game.at(7, 2)),
        new DestroyableTile(position = game.at(9, 2)),
        new DestroyableTile(position = game.at(12, 2)),
        
        new DestroyableTile(position = game.at(4, 1)),
        new DestroyableTile(position = game.at(5, 1)),
        new DestroyableTile(position = game.at(6, 1)),
        new DestroyableTile(position = game.at(7, 1)),
        new DestroyableTile(position = game.at(9, 1)),
        new DestroyableTile(position = game.at(10, 1)),
        new DestroyableTile(position = game.at(11, 1)),
        new DestroyableTile(position = game.at(12, 1))
    ]
)
