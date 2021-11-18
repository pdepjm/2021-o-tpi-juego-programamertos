import wollok.game.*
import tile.*
import level.*

//TODO level has to assign sand images to tiles and obstacles
object levelSand inherits Level{
	
    override method levelName() = "sand"

	override method renderSolidTiles(){
		
		const pos1 = [8] //(15, 1)
		const pos2 = [2, 3, 5, 6, 8, 10, 11, 13, 14] //(14, 2)
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14] //(12, 4)
		const pos4 = [5, 11] //(11, 5)
		const pos5 = [1, 3, 8, 13, 15] //(10, 6)
		const pos6 = [3, 4, 5, 7, 8, 9, 11, 12, 13] //(9, 7)
		
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
				
		//const columns = [pos1, pos2, pos3, pos4, pos5, pos6]
		//const rows = [[1, 15], [2, 14], [4, 12], [5, 11], [6, 10], [7, 9]]

		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){
	
		const pos1 = [4, 5, 6, 7, 9, 10, 11, 12]
		const pos2 = [4, 7, 9, 12]
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14]
		const pos4 = [1, 4, 6, 10, 12, 15]
		const pos5 = [1, 3, 4, 8, 12, 13, 15]
		const pos6 = [2, 5, 6, 10, 11, 14]
		const pos7 = [1, 3, 5, 8, 11, 13, 15]
			
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 15)) )} )
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 1)) )} )
		
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 14)) )} )
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 2)) )} )
		
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 13)) )} )
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 3)) )} )
		
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 12)) )} )
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 4)) )} )
		
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 11)) )} )
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 5)) )} )
		
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 10)) )} )
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 6)) )} )
		
		pos7.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 8)) )} )
		
		destroyableTiles.forEach({tile => tile.render()})
	}
}

//TODO level has to assign stone images to tiles and obstacles
object levelStone inherits Level{
    override method levelName() = "stone"

    //TODO: Cambiar para que quede distinto a los otros niveles
	override method renderSolidTiles(){
		
		const pos1 = [8] //(15, 1)
		const pos2 = [2, 3, 5, 6, 8, 10, 11, 13, 14] //(14, 2)
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14] //(12, 4)
		const pos4 = [5, 11] //(11, 5)
		const pos5 = [1, 3, 8, 13, 15] //(10, 6)
		const pos6 = [3, 4, 5, 7, 8, 9, 11, 12, 13] //(9, 7)
		
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 15)) )} )
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 1)) )} )
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 15))) })
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 1)))  })
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 13)) )})
		pos1.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 3)) )} )
		
		pos2.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 14)) )} )
		pos2.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 2)) )} )
		
		pos3.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 12)) )} )
		pos3.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 4)) )} )
		
		pos4.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 11)) )} )
		pos4.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 5)) )} )
		
		pos5.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 10)) )} )
		pos5.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 6)) )} )
	    solidTiles.add( new SolidTile(position = game.at(8, 10))) 
		
		pos6.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 9)) )} )
		pos6.forEach({ n => solidTiles.add( new SolidTile(position = game.at(n, 7)) )} )
				

		solidTiles.forEach({tile => tile.render()})
	}
	
    //TODO: Cambiar para que quede distinto a los otros niveles
	override method renderDestroyableTiles(){
	
		const pos1 = [4, 5, 6, 7, 9, 10, 11, 12]
		const pos2 = [4, 7, 9, 12]
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14]
		const pos4 = [1, 4, 6, 10, 12, 15]
		const pos5 = [1, 3, 4, 8, 12, 13, 15]
		const pos6 = [2, 5, 6, 10, 11, 14]
		const pos7 = [1, 3, 5, 8, 11, 13, 15]
		
			
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 15)) )} )
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 1)) )} )
		
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 14)) )} )
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 2)) )} )
		
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 13)) )} )
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 3)) )} )
		
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 12)) )} )
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 4)) )} )
		
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 11)) )} )
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 5)) )} )
		
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 10)) )} )
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 6)) )} )
		
		pos7.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 8)) )} )
		
		destroyableTiles.forEach({tile => tile.render()})
	}

}

//TODO level has to assign dungeon images to tiles and obstacles
object levelDungeon inherits Level{
    override method levelName() = "dungeon"

	//TODO: Cambiar para que quede distinto a los otros niveles
	override method renderSolidTiles(){
		
		const pos1 = [8] //(15, 1)
		const pos2 = [2, 3, 5, 6, 8, 10, 11, 13, 14] //(14, 2)
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14] //(12, 4)
		const pos4 = [5, 11] //(11, 5)
		const pos5 = [1, 3, 8, 13, 15] //(10, 6)
		const pos6 = [3, 4, 5, 7, 8, 9, 11, 12, 13] //(9, 7)
		
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
				

		solidTiles.forEach({tile => tile.render()})
	}
	
    //TODO: Cambiar para que quede distinto a los otros niveles
	override method renderDestroyableTiles(){
	
		const pos1 = [4, 5, 6, 7, 9, 10, 11, 12]
		const pos2 = [4, 7, 9, 12]
		const pos3 = [2, 3, 5, 7, 8, 9, 11, 13, 14]
		const pos4 = [1, 4, 6, 10, 12, 15]
		const pos5 = [1, 3, 4, 8, 12, 13, 15]
		const pos6 = [2, 5, 6, 10, 11, 14]
		const pos7 = [1, 3, 5, 8, 11, 13, 15]
			
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 15)) )} )
		pos1.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 1)) )} )
		
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 14)) )} )
		pos2.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 2)) )} )
		
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 13)) )} )
		pos3.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 3)) )} )
		
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 12)) )} )
		pos4.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 4)) )} )
		
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 11)) )} )
		pos5.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 5)) )} )
		
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 10)) )} )
		pos6.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 6)) )} )
		
		pos7.forEach({ n => destroyableTiles.add( new DestroyableTile(position = game.at(n, 8)) )} )
		
		destroyableTiles.forEach({tile => tile.render()})
	}
}