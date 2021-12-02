import wollok.game.*
import tile.*
import level.*

object levelSand inherits Level{
	
    override method levelName() = "sand"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(1, 11), game.at(11, 1)]
	}

	override method renderSolidTiles(){
		
		const pos1 = [6] //(1, 11)
		const pos2 = [2, 3, 5, 6, 7, 9, 10] //(2, 10)
		const pos3 = [6] //(3, 9)
		const pos4 = [1, 2, 10, 11] //(4, 8)
		const pos5 = [5, 7] //[5, 7]
		const pos6 = [3, 4, 5, 7, 8, 9] //(6)
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6]
		
		renderizer.getRender(solidTiles, columns, self)
				
		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){
		
		const pos1 = [3, 5, 7, 9] //(1, 11)
		const pos3 = [1, 3, 4, 5, 7, 8, 9, 11] //(3, 9)
		const pos4 = [5, 7] //(4, 8)
		const pos5 = [1, 3, 4, 6, 8, 9, 11] //[5, 7]
		const pos6 = [2, 6, 10] //(6)
		
		//TIP: Add [] for empty columns 	
		const columns = [pos1, [], pos3, pos4, pos5, pos6]
		
		renderizer.getRender(destroyableTiles , columns , self)
		
		destroyableTiles.forEach({tile => tile.render()})	
	}
}


object levelDungeon inherits Level{
    override method levelName() = "dungeon"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(1, 6), game.at(11, 6)]
	}

	override method renderSolidTiles(){
		
		const pos1 = [5, 7] 
		const pos2 = [2, 3, 9, 10] 
		const pos3 = [1, 2, 3, 9, 10, 11]
		const pos4 = [3, 5, 7, 9] 
		const pos5 = [6] 
		const pos6 = [4, 8] 
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6]
		
		renderizer.getRender(solidTiles, columns, self)	

		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){
	
		const pos1 = [3, 4, 8, 9]
		const pos2 = [5, 6, 7]
		const pos3 = [1, 5, 7, 11]
		const pos4 = [1, 2, 4, 6, 8, 10, 11]
		const pos5 = [2, 5, 7, 10]
		const pos6 = [3, 6, 9]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6]
		
		renderizer.getRender(destroyableTiles, columns, self)
		
		destroyableTiles.forEach({tile => tile.render()})
	}
}


object levelStone inherits Level{
	
    override method levelName() = "stone"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(1, 11), game.at(11, 1)]
	}

	override method renderSolidTiles(){
		const pos1 = [3, 6, 9]
		const pos2 = [6]
		const pos3 = [1, 4, 8, 11]
		const pos4 = [4, 8]
		const pos5 = [3, 4, 8, 9]
		const pos6 = [2, 3, 9, 10]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6]
		
        renderizer.getRender(solidTiles , columns , self)

		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){

        const pos1 = []
		const pos2 = [2, 3, 5, 7, 9, 10]
		const pos3 = [2, 6, 10]
		const pos4 = [1, 3, 6, 9, 11]
		const pos5 = [2, 5, 7, 10]
		const pos6 = [4, 6, 8]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6]

        renderizer.getRender(destroyableTiles, columns, self)

		destroyableTiles.forEach({tile => tile.render()})
		}
}


object renderizer{
	
	method getRender(typeTile , listPositions , level){
	 	const range = [[1, 11], [2, 10], [3, 9], [4, 8], [5, 7], [6]]
	 
	 	6.times({num => (self.getPosition(listPositions, num - 1)).
	 		forEach({ n => self.addTile(typeTile, n, range.get(num - 1), level) })
	 	})
	}
  		
	method getPosition(list, number){
		if(list.size() > number) return list.get(number)
		else return []
	}
	
	method addTile(typeTile, nPosition, range, level){
		if (typeTile.equals(level.solidTiles())) range.forEach({m => typeTile.add( new SolidTile(position = game.at(nPosition , m)))})
		else range.forEach({m => typeTile.add( new DestroyableTile(position = game.at(nPosition , m)))}) 
	}
}	
		
