import Nave.*

class Jugador {
    const mochila = []
    const tareas = []
    var nivelDeSospecha = 40
    var votoImpugnado = false
    var estaVivo = true

    method removerItem(unItem) { mochila.remove(unItem) }
    method buscarItem(unItem) { mochila.add(unItem)}
    method tieneItems() = !mochila.isEmpty()

    method esSospechoso() = nivelDeSospecha > 50
    method estaVivo() = estaVivo
    method nivelDeSospecha() = nivelDeSospecha

    method completoLasTareas() = tareas.all{tarea => tarea.estaCompletada()}
    method realizarUnaTarea() { tareas.anyOne().realizarla(self) }

    method aumentarNivelDeSospecha(cantidad) { nivelDeSospecha += cantidad }
    method disminuirNivelDeSospecha(cantidad) { nivelDeSospecha -= cantidad }
    method tiene(unItem) = mochila.contains(unItem)

    method votoEnBlanco() { votoImpugnado = true }

    method llamarReunionDeEmergencias() { nave.votacion() }
    method expulsar() { estaVivo = false }
    method votar() // ToDo: Hacer que pueda votar el impugnado
}

class Impostor inherits Jugador {
    
    method realizarTarea() { }
    method realizarSabotaje(unSabotaje) {
        unSabotaje.sabotear()
        self.aumentarNivelDeSospecha(5)
    }
    
    override method votar() { nave.cualquierJugadorVivo()}
    override method expulsar() { 
        super()
        nave.descontarTripulantes()
    }
}

class Tripulante inherits Jugador {
    const personalidad

    method realizarTarea() { tareas.forEach{tarea => tarea.realizarla(self)} }
    method informarALaNave() { nave.chequeoDeTareas() }

    override method votar() { personalidad.votar() }
    override method expulsar() { 
        super()
        nave.descontarTripulantes()
    }
}   

