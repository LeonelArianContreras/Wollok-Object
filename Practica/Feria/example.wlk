object julieta {
  var tickets = 0
  var cansancio = 0
  
  method fuerza() = 75 - cansancio

  method punteria() = 20
  
  method jugar(juego) {
    tickets = tickets + juego.tickets(self)
    cansancio = cansancio + juego.cansancio()
  }

  method canjear(peluche) = tickets >= peluche.costo()
}

object tiroAlBlanco {
  method tickets(persona) = (persona.punteria() / 10).roundUp()
  method cansancio() = 3
}


object pruebaDeFuerza {
  method tickets(persona) = if(persona.fuerza() >= 75) 20 else 0
  method cansancio() = 8
    
}

object ruedaDeLaFortuna {
  var property aceitada = true

  method tickets() = 1.randomUpTo(20) 
  method cansancio() = if(aceitada) 0 else 1
}

object ositoDePeluche {
  method costo() = 45
}

object taladro {
  var property precio = 10
  method costo() = precio
}

object gerundio {
  method canjear(peluche) = true
}

// El polimorfismo depende siempre de un tercero, según ese tercero se decide si son o no polimorficos los dos objetos
// Por ejemplo, si para un tercero se quisiese que juegue los jueguitos y canjee, se deberia agregar el method jugar(juego)
