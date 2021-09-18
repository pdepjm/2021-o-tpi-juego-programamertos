import wollok.game.*

// Utilizar este objeto para crear sonidos.
// NO utilizar directamente game.sound(audioFile) porque puede complicarles el testeo
// En su lugar utilicen: soundProducer.sound(audioFile)
// Si sus tests fallan porque les dice que no pueden iniciar sonidos antes de que empiece el juego
// lo que deben hacer es cambiar el proveedor del soundProducer, asi: soundProducer.provider(soundProviderMock)

object soundProducer {
	
	var provider = game
	
	method provider(_provider){
		provider = _provider
	}
	
	method sound(audioFile) = provider.sound(audioFile)
	
}

object soundProviderMock {
	
	method sound(audioFile) = soundMock
	
}

object soundMock {
	
	method pause(){}
	
	method paused() = true
	
	method play(){}
	
	method played() = false
	
	method resume(){}
	
	method shouldLoop(looping){}
	
	method shouldLoop() = false
	
	method stop(){}
	
	method volume(newVolume){}
	
	method volume() = 0
}