import Items.*
import Nave.*

class Tarea {
    var estaCompletada = false

    method realizarla(unJugador)
    method tareaCompletada(unJugador) { 
        estaCompletada = true 
        unJugador.informarALaNave() 
    }
}

class ArreglarTablero inherits Tarea {

    override method realizarla(unJugador) {
        if(unJugador.tiene(llaveInglesa)) {
            unJugador.aumentarNivelDeSospecha(10)
            self.tareaCompletada(unJugador)
        }
            
    }
}

class SacarBasura inherits Tarea {

    override method realizarla(unJugador) {
        if(unJugador.tiene(escoba) && unJugador.tiene(bolsaDeConsorcio)) {
            unJugador.disminuirNivelDeSospecha(4)
            self.tareaCompletada(unJugador)
        } 
    }
}

class VentilarLaNave inherits Tarea {

    override method realizarla(unJugador) { 
        nave.aumentarNivelDeOxigeno(5) 
        self.tareaCompletada(unJugador)
    }
}