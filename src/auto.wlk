import wollok.game.*

object auto {
	// definimos los atributos para imagen y posición de nuestro elemento
	var image = "autitoRojo.png"
	var position = game.at(0,0)

	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method posicion(nuevaPosicion) { position = nuevaPosicion }
	
	method autoSano(){
		return
		image == "autitoRojo.png" or
		image == "autitoVerde.png" or
		image == "autitoAzul.png"
		}
		

	//parametros posibles: right, left, up, down.
	method mover(dir) {
		if ( self.autoSano() ){
		    if (dir == "right") {
		        self.posicion(self.position().right(1))
		    } else if (dir == "left") {
		        self.posicion(self.position().left(1))
		    } else if (dir == "up") {
		        self.posicion(self.position().up(1))
		    } else if (dir == "down") {
		        self.posicion(self.position().down(1))
		    } else position
		}
	}
}


object wall{
	var property position = game.at(9,3)
	method image() = "paredLadrillos2.jpg"
	
	method colision(){
		auto.image("Boom.png")
		game.removeVisual(self)
		game.sound("choque.mp3").play()
	}
}

object carPaint{
	var property position = game.at(4,2)
	const pinturas = ["autitoRojo.png","autitoAzul.png","autitoVerde.png"]
	var numPinturaActual = 0
	
	method image() = "carPaint.png"
	
	method pinturaActual() = pinturas.get(numPinturaActual)
	
	method siguientePintura(){
		if (numPinturaActual < 2){ numPinturaActual += 1 } else numPinturaActual = 0
		return(self.pinturaActual())
	}
	
	method colision(){
		auto.image(self.siguientePintura())
		game.sound("spray.mp3").play()
	}
	
}