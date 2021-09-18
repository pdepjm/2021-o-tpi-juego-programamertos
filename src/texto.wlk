import wollok.game.*

// ¡Los visuales también pueden ser texto!
// Hay que definir la posición en la que debe aparecer
// Y el texto que se debe mostrar. Para eso debe implementar el método text()
// el cual debe devolver un string
// Por defecto el color es azul, pero se puede modificar
// Para ello debe entender el mensaje textColor()
// El método debe devolver un string que represente el color
// Debe ser en un formato particular: tiene que ser un valor RGBA en hexa "rrggbbaa"
// Les dejamos algunos ejemplos
// ¡También se puede combinar con las imágenes!

object texto {
	
	method position() = game.at(2, 4)
	
	method text() = "¡Pepita!"
	
	method textColor() = paleta.verde()
	
}

object paleta {
	method verde() = "00FF00FF"
	method rojo() = "FF0000FF"
}
