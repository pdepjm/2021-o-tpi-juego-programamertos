# Preguntas teóricas

[//]: # ( ----- Polimorfismo -----)

## Polimorfismo
El polimorfismo es la capacidad de un objeto de ser intercambiable con otro, sin que un tercero que los usa se vea afectado.

En nuestro juego usamos polimorfismo para la implementación del método harm() de la explosión de una bomba.<br>
*bomb.wlk*<br>
![image](https://user-images.githubusercontent.com/72177829/139640504-4134d5c6-f20d-4413-b093-577539f45b28.png)

Esto nos permite:
Destruir un obstáculo (un objeto destruible por el jugador)
Explotar instantáneamente otra bomba
Hacer que un jugador pierda

Por lo tanto, el mensaje harm() es entendido por todos los objetos posicionados en el camino de la explosión y la bomba se aprovecha de esto para poner en efecto su daño.

[//]: # ( ----- Colecciones ----- )

## Colecciones
Utilizamos una lista de jugadores en levelManager.wlk para setear el inicio del juego. La clase jugador entiende los mensajes spawn() y setup(), y en la versión inicial del juego tenemos dos jugadores instanciados.

![image](https://user-images.githubusercontent.com/72177829/139640588-3cff6626-9aaa-427e-ab8b-4e6a1c54ea95.png)

Utilizamos el mensaje forEach, que aplica una operación sobre todos los elementos de una colección, dado que queremos generar un efecto en todos los jugadores que tiene el nivel (agrupados en dicha lista).

[//]: # ( ----- Clases ----- )

## Clases
Usamos clases para definir los niveles (en la versión inicial del juego hay un único nivel, pero se pretendía extenderlo a distintos niveles con obstáculos y diseños propios), para los jugadores (todos los jugadores comparten un color, una posición, teclas para moverse y colocar bomba, los mismos métodos de recibir daño y de perder, entre otros), para las bombas y los botones del menú.

En general, utilizamos clases en vez de objetos porque tenemos la necesidad de repetir la misma lógica para muchos objetos que se comportan de la misma manera, y con las clases podemos escribir toda esa lógica una única vez y luego instanciar tantos objetos como requiriéramos.

Nos detenemos en el caso de las bombas, que nos parece más apropiado para argumentar nuestra decisión. Toda la lógica que necesitamos para las bombas, como es igual para todas, podemos tenerla directamente en un solo lugar.

Lo interesante de las bombas es que, en vez de instanciar objetos de esta clase directamente en el código (como los niveles y los botones de menú), las bombas se instancian en tiempo de ejecución a demanda del jugador al presionar su tecla de colocación de bomba.

Se observa con la palabra reservada new Bomb():

![image](https://user-images.githubusercontent.com/72177829/139642019-8b2b4b7d-b79f-44f4-88dc-25fdbce78933.png)



### ¿Dónde o cuándo se instancian los objetos?

> En el archivo levels instanciamos los distintos tipos de tiles (SolidTile y DestroyableTile) como objetos en las posiciones donde deben aparecer en el nivel indicado.

[//]: # ( ----- Herencia ----- )

## Herencia
En la sección anterior nos reservamos hablar de los botones de menú para detallar su uso de herencia.

Al definir una clase, se puede especificar que hereda de otra clase. A la nueva clase se la llama subclase y a la de cual se hereda, superclase.

Hacemos uso de la herencia a partir de la clase Button en menu.wlk.

![image](https://user-images.githubusercontent.com/72177829/139642097-43656092-da38-484d-9df1-76a16a3e243b.png)

Definimos un botón como un objeto con varios atributos, como la imagen del botón seleccionado y no seleccionado. Esto es así para poder definir diversos botones y representar cómo el jugador scrollea por el menú de inicio y selecciona opciones.

Cada botón (jugar, controles, créditos) es un objeto que hereda de la clase Button.

![image](https://user-images.githubusercontent.com/72177829/139642132-c002a77e-d122-4137-8b96-38f7b3040533.png)

![image](https://user-images.githubusercontent.com/72177829/139642158-63afccd8-a89f-4a53-a543-2ac7473958d9.png)

![image](https://user-images.githubusercontent.com/72177829/139642180-40a4d606-ae35-48b0-9848-9102d56a688e.png)

[//]: # ( ----- Composición ----- )
Para definir las direcciones en las que un jugador puede moverse por el mapa utilizamos composición. Cada dirección es un objeto distinto con un único método, y para todos el efecto del mensaje es diferente, por lo que no tendría sentido usar herencia para definirlos ya que no comparten lógica que se pueda abstraer.<br>

*directions.wlk*<br>
![image](https://user-images.githubusercontent.com/72177829/139642248-799ff207-316d-4378-80d8-ddef772699a2.png)

*players.wlk*<br>
![image](https://user-images.githubusercontent.com/72177829/139642269-767b244a-ead6-404c-b62c-c9b0a5e855d8.png)

En el momento en que el jugador quiere moverse en cierta dirección, el método move(direction) envía un mensaje al objeto dirección a la que se quiera mover, pidiéndole la próxima posición del jugador en caso de que efectivamente pueda moverse hacia ahí (en caso de chocar con una pared, obstáculo o bomba no podrá pasar).

