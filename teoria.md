# Preguntas teóricas

[//]: # ( ----- Polimorfismo -----)

## Polimorfismo
El polimorfismo es la capacidad de un objeto de ser intercambiable con otro, sin que un tercero que los usa se vea afectado.

### ¿Cuál es el mensaje polimórfico?
En nuestro juego usamos polimorfismo para la implementación del método harm() de la explosión de una bomba.

### ¿Qué objetos lo implementan?

### ¿Qué objeto se aprovecha de ello?

[//]: # ( ----- Colecciones ----- )

## Colecciones

### ¿Qué operaciones de colecciones se utilizan?

> Utilizamos la operacion add en levels.wlk para ahorrarnos el trabajo de poner manualmente cada tile en su respectiva posición.

> Estimamos que para los power-ups vamos a tener que utilizar colecciones y para tener un registro de que personajes están vivos para terminar el nivel.

### ¿Usaron mensajes con y sin efecto?

### ¿Para qué?

[//]: # ( ----- Clases ----- )

## Clases

### ¿Usan clases?

> Sí

### ¿Por qué?

>Para representar objetos que tienen un comprtamiento similar a pesar de una identidad distinta. Como es el ejemplo en el archivo tile.wlk al representar un SolidTile lo tenemos que hacer con una clase debido a que necesitamos un conjunto con compartamiento similar pero en distinta posicion.

### ¿Dónde o cuándo se instancian los objetos?

> En el archivo levels instanciamos los distintos tipos de tiles (SolidTile y DestroyableTile) como objetos en las posiciones donde deben aparecer en el nivel indicado.

[//]: # ( ----- Herencia ----- )

## Herencia

### ¿Entre quiénes y por qué?

> Implementamos una clase "madre" Tile que representa una "baldosa" por celda la cual puede tener distintos comportamientos. Las clases que heredan dicho "Tile" son SolidTile (Inatravesable), DestroyableTile (Destruible) y BorderTile (Delimita el límite del mapa).

### ¿Qué comportamiento es común y cuál distinto?

> En cuanto al comportamiento común, todas tienen una posición fija, pueden ser renderizadas y "des-renderizadas". Lo que tienen distinto son sus propiedades de imagen, de si pueden ser pisadas o no, y de si pueden ser destruidas o no.

[//]: # ( ----- Composición ----- )

## Composición

### ¿Qué objetos interactúan?

### ¿Dónde se delega?

### ¿Por qué no herencia?
