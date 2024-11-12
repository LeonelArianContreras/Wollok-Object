
object alegria {

  method afectarPorEmocion(unaPersona) {
    if(unaPersona.nivelDeFelicidad() > 500)
      unaPersona.convertirEnPensamientoCentral()
  }

  method esAlegre() = true

  method niegaA(unRecuerdo) = unRecuerdo.emocionDominante() != self

}

object tristeza{

  method afectarPorEmocion(unaPersona) {
    unaPersona.convertirEnPensamientoCentral()
    unaPersona.disminuirFelicidad(10)
  }

  method niegaA(unRecuerdo) = unRecuerdo.tieneEmocionAlegre()

  method esAlegre() = false

}

object disgusto{

  method afectarPorEmocion(_unaPersona) { }

  method niegaA(_unRecuerdo) = false

  method esAlegre() = false

}

object furia{

  method afectarPorEmocion(_unaPersona) { }

  method niegaA(_unRecuerdo) = false

  method esAlegre() = false

}

object temor{

  method afectarPorEmocion(_unaPersona) { }

  method niegaA(_unRecuerdo) = false 

  method esAlegre() = false

}

class EmocionesCompuestas {
  const emociones = []

  method niegaA(unRecuerdo) = emociones.all{ emocion => emocion.niegaA(unRecuerdo) }
  method esAlegre() = emociones.any{ emocion => emocion.esAlegre() }

  method afectarPorEmocion(unaPersona) {
    emociones.forEach{ emocion => emocion.afectarPorEmocion(unaPersona) }
  }

}