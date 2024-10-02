object pepita {
  var energy = 100

  method vola(kilometros) {
    energy = energy - 5
  }
  method come(gramos) {
    energy = energy + gramos
  }
}

object pepe {
  var energy = 100

  method vola(kilometros) {
    energy = energy - kilometros
  }
}

object emilia {
  method entrena(ave) {
    ave.vola(5)
  }
}