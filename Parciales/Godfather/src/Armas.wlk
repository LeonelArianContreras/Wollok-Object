class Revolver {
  var cantidadDeBalas

  method cantidadDeBalas() = cantidadDeBalas

  method usarContra(unaPersona) {
    if(cantidadDeBalas > 0) {
      unaPersona.estaVivo(false)
      cantidadDeBalas -= 1
    }
  }

  method esSutil() = cantidadDeBalas == 1
}

class Escopeta {

  method usarContra(unaPersona) {
    self.verificarHerida(unaPersona)
    unaPersona.estaHerido(true)
  }

  method verificarHerida(unaPersona) {
    if(unaPersona.estaHerido())
      unaPersona.estaVivo()
  }

  method esSutil() = false
}

class CuerdaDePiano {
  const esDeCalidad = true

  method usarContra(unaPersona) {
    if(esDeCalidad)
      unaPersona.estaVivo()
  }

  method esSutil() = true
}

const revolverCon6Balas = new Revolver(cantidadDeBalas = 6)
object escopeta {}