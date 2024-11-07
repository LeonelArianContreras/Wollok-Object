import Items.*

object nave {
    const jugadores = []
    var nivelDeOxigeno = 100
    var cantidadTripulantes = 10
    var cantidadImpostores = 10

    method descontarTripulantes() { cantidadTripulantes -= 1}
    method descontarImpostores() { cantidadImpostores -= 1 }
    method aumentarNivelDeOxigeno(cantidad) { nivelDeOxigeno += cantidad }
    method disminuirNivelDeOxigeno(cantidad) {
        nivelDeOxigeno -= cantidad 
        self.verificacionDeNivelDeOxigeno()
    }

    method chequeoDeTareas() { 
        self.verificacionDeTareasTotales()
    }

    method verificacionDeTareasTotales() {
        if(self.todoJugadorCompletoSusTareas())
            throw new DomainException(message = "Los Tripulantes han ganado!")
    }

    method verificacionDeNivelDeOxigeno() {
        if(nivelDeOxigeno <= 0)
            throw new DomainException(message = "Siamo fuori di la coppa!")
    }

    method todoJugadorCompletoSusTareas() = jugadores.all{jugador => jugador.completoLasTareas()}
    method alguienTiene(unItem) = jugadores.any{jugador => jugador.tiene(tuboDeOxigeno)}

    method jugadoresVivos() = jugadores.filter{jugador => jugador.estaVivo()}

    method cualquierJugadorVivo() = self.jugadoresVivos().anyone()

    method cualquierJugadorNoSospechoso() = self.jugadoresVivos().findOrDefault({jugador => !jugador.esSospechoso()}, votoEnBlanco)
    method jugadorConMasNivelDeSospecha() = self.jugadoresVivos().max{jugador => jugador.nivelDeSospecha()}
    method cualquierJugadorSinItems() = self.jugadoresVivos().findOrDefault({jugador => !jugador.tieneItems()}, votoEnBlanco)

    method votos() = self.jugadoresVivos().map{jugador => jugador.votar()}
    method votacion() { 
        const elMasVotado = self.votos().max{alguien => self.votos().occurrencesOf(alguien)}
        elMasVotado.expulsar()
        self.verificarCantidadDeTripulantesEImpostores()
    }

    method verificarCantidadDeTripulantesEImpostores() {
        if(cantidadImpostores == 0)
            throw new DomainException(message = "Ganan los Tripulantes!")
        else if(cantidadImpostores == cantidadTripulantes)
            throw new DomainException(message = "Ganan los Impostores!")
    }
}

object votoEnBlanco { }