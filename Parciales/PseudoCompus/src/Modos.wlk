import SuperComputadora.*

class Standard {
  method consumo(unEquipo) = unEquipo.consumo(unEquipo)
  method computo(unEquipo) = unEquipo.computo(unEquipo)
  
  method realizarComputo(unEquipo) { }
}

class Overclock {
  var cantidadDeOverclocksDisponibles = 20
  method consumo(unEquipo) = unEquipo.consumo() * 2
  method computo(unEquipo) = unEquipo.computoConOverclock()
  
  method realizarComputo(unEquipo) {
    self.verificacionDeQuemadura(unEquipo)
    cantidadDeOverclocksDisponibles -= 1
  }

  method verificacionDeQuemadura(unEquipo) {
    if(cantidadDeOverclocksDisponibles == 0) {
        unEquipo.quemado(true)
        throw new DomainException(message = "Se quemo la poronguita!")
    }
  }
}

class AhorroDeEnergia {
  var property computos = 0

  method consumo(_unEquipo) = 200
  method computo(unEquipo) = 
    self.consumo(unEquipo) / unEquipo.consumo(unEquipo) * unEquipo.computo(unEquipo)

  method realizarComputo(unEquipo) {
    self.verificacionDeErrorPeriodico()
    self.aumentarContadorDeComputos()
  }

  method aumentarContadorDeComputos() {
    computos += 1
  }

  method verificacionDeErrorPeriodico() {
    if(computos % 17 == 0)
        throw new DomainException(message = "Error periodico!")
  }
}

class APruebaDeFallas inherits AhorroDeEnergia {
  override method consumo(_unEquipo) = super(_unEquipo) / 2

  override method realizarComputo(unEquipo) {
    self.verificacionDeErrorPeriodico()
    self.aumentarContadorDeComputos()
  }
  
  override method verificacionDeErrorPeriodico() {
    if(computos % 100 == 0)
            throw new DomainException(message = "Error periodico!")
  }
}