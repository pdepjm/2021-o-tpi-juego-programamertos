import wollok.game.*
import tile.*
import level.*

//TODO level has to assign sand images to tiles and obstacles
object levelSand inherits Level{
	
    override method levelName() = "sand"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(1, 11), game.at(1, 1), game.at(11, 11), game.at(1, 1)]
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


//TODO level has to assign stone images to tiles and obstacles
object levelStone inherits Level{
	
    override method levelName() = "stone"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(8, 2), game.at(8, 14), game.at(2, 8), game.at(14, 8)]
   }

override method renderSolidTiles(){
        const pos1 = [6 , 10] 
        const pos3 = [6 , 10] 
		const pos4 = [5 , 6, 10, 11] 
		const pos5 = [4, 5, 11, 12] 
		const pos6 = [1, 3, 4, 12, 13, 15] 
		const pos8 = [8] 
        
        //TIP: Add [] for empty columns 
		const columns = [pos1 , [] , pos3, pos4 , pos5, pos6, [], pos8]

        renderizer.getRender(solidTiles , columns , self)

		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){

        const pos1 = [1, 3, 4, 8, 9, 13, 14, 15]
		const pos2 = [1, 2, 3, 5, 4, 10, 11, 12, 13]
		const pos3 = [2, 3, 7, 11, 13, 14]
		const pos4 = [2, 3, 4, 8, 14]
		const pos5 = [2, 3, 6, 9, 13, 14, 15, 10]
		const pos6 = [2, 5, 6, 7, 14, 11]
		const pos7 = [1, 2, 4, 5, 7, 9, 10, 11, 12]
		const pos8 = [4, 6, 10, 12]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8]

        renderizer.getRender(destroyableTiles , columns , self)

		destroyableTiles.forEach({tile => tile.render()})

		}
}



//TODO level has to assign dungeon images to tiles and obstacles
object levelDungeon inherits Level{
    override method levelName() = "dungeon"
    
    override method newSpawnPoints(){
    	spawnPoints = [game.at(7, 8), game.at(9, 8), game.at(8, 7), game.at(8, 9)]
   }

	override method renderSolidTiles(){
		
		const pos1 = [5, 11] 
		const pos2 = [2, 3, 13, 14] 
		const pos3 = [2, 3, 13, 14]
		const pos4 = [2, 3, 13, 14, 5, 11] 
		const pos5 = [6, 10] 
		const pos6 = [6, 10, 1, 15] 
		const pos7 = [7, 9]
		const pos8 = [8]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8]
		
		renderizer.getRender(solidTiles , columns , self)	

		solidTiles.forEach({tile => tile.render()})
	}
	
	override method renderDestroyableTiles(){
	
		const pos1 = [9, 10]
		const pos2 = [1, 5, 7, 12, 15]
		const pos3 = [6, 9]
		const pos4 = [4, 6, 8, 10, 12]
		const pos5 = [1, 4, 7, 11, 13, 14]
		const pos6 = [2, 9, 12]
		const pos7 = [3, 5, 11, 13]
		const pos8 = [1, 4, 13, 15]
		
		//TIP: Add [] for empty columns 
		const columns = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8]	
		
		renderizer.getRender(destroyableTiles , columns , self)
		
		destroyableTiles.forEach({tile => tile.render()})
	}
}


object renderizer{
	
	method getRender(typeTile , listPositions , level){
	 
        (self.getPosition(listPositions, 0)).forEach({ n => self.addTile(typeTile , n , [1 , 11] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [1, 13]
		
		(self.getPosition(listPositions, 1)).forEach({ n => self.addTile(typeTile , n , [2 , 10] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [2, 12]
		
		(self.getPosition(listPositions, 2)).forEach({ n => self.addTile(typeTile , n , [3 , 9] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [3, 11]
		
		(self.getPosition(listPositions, 3)).forEach({ n => self.addTile(typeTile , n , [4 , 8] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [4, 10]

		(self.getPosition(listPositions, 4)).forEach({ n => self.addTile(typeTile , n , [5 , 7] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [5, 9]
		
		(self.getPosition(listPositions, 5)).forEach({ n => self.addTile(typeTile , n , [6] , level) } ) //TODO OPC: Para mapa 13x13, cambiar a [6, 8]
		
		//(self.getPosition(listPositions, 6)).forEach({ n => self.addTile(typeTile , n , [7] , level) } )  //TODO OPC: Para mapa 13x13, cambiar a [7]		
  }
  		
	method getPosition(list , number){
		if(list.size() > number) return list.get(number)
		else return []
}
	
	method addTile(typeTile , nPosition , range , level){
		if(typeTile.equals(level.solidTiles())) range.forEach({m => typeTile.add( new SolidTile(position = game.at(nPosition , m)))})
		else range.forEach({m => typeTile.add( new DestroyableTile(position = game.at(nPosition , m)))}) 
	}
	
	
	/* OP: Otro metodo de generar los niveles (no funciona)
	method getRender(typeTile , listPositions){
	 
	var countLine = 0
	
 	var row1 = 1
	
	var row2 = 15
	
    if(listPositions.size() > countLine){
       
        self.getPosition(listPositions , countLine).forEach({ n => self.addTile(typeTile , n , [row1 , row2]) } )
		
		countLine = countLine + 1
		
		row1 = row1 + 1 
		
		row2 = row2 - 1
    }
    else 		
  }
  
  */
}	
		
