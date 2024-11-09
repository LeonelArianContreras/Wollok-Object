
class Don {
  const property subordinados = []

  method atacar(_unAtacante, unaPersona) {
    const algunSubordinado = subordinados.anyone()
    2.times{algunSubordinado.atacar(algunSubordinado, unaPersona)}
  }

  method despachaElegantemente() = true

  method esSoldado() = false
  method esDon() = true
}

class Subjefe {
  const subordinados = []

  method atacar(unAtacante, unaPersona) {
    unAtacante.usarArma()
  }

  method esSoldado() = false
  method esDon() = false

  method despachaElegantemente(_unaPersona) = subordinados.any{subordinado => subordinado.tieneArmaSutil()}
}

class Soldado {

  method atacar(unAtacante, unaPersona) {
    unAtacante.armaMasCercana().usarContra(unaPersona)
  }

  method esSoldado() = true
  method esDon() = false

  method despachaElegantemente(unaPersona) = unaPersona.tieneArmaSutil()
}
