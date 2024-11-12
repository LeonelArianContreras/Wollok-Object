class Persona {
  const recuerdos = []
  const pensamientosCentrales = []
  const memoriaDeLargoPlazo = []

  var edad
  var nivelDeFelicidad = 1000
  var emocionDominante

  method emocionDominante() = emocionDominante
  method nivelDeFelicidad() = nivelDeFelicidad

  method vivirEvento(unRecuerdo) { 
    self.agregarRecuerdoDelDia(unRecuerdo)
    unRecuerdo.afectarA(self)
  }

  method agregarRecuerdoDelDia(unRecuerdo) { recuerdos.add(unRecuerdo) }

  method convertirEnPensamientoCentral(unRecuerdo) { pensamientosCentrales.add(unRecuerdo) }

  method disminuirFelicidad(cantidad) { 
    nivelDeFelicidad = nivelDeFelicidad - nivelDeFelicidad * cantidad / 100
    self.verificarFelicidad()
  }

  method verificarFelicidad() {
    if(nivelDeFelicidad < 1)
      throw new DomainException(message = "¡Nivel De Felicidad Muy Bajo!")
  }

  method recuerdosRecientes() = recuerdos.sortBy{r1, r2 => r1.fecha() > r2.fecha()}.take(5)

  method pensamientosCentrales() = pensamientosCentrales

  method pensamientosCentralesDificilesDeExplicar() = pensamientosCentrales.filter{ pensamiento => pensamiento.esDificilDeExplicar() }

  method negarRecuerdos(unRecuerdo) { emocionDominante.negarA(unRecuerdo) }

  method enviarADormir(keyWord) {
    recuerdos.forEach{ recuerdo => recuerdo.afectarPorEmocion(self) }
    recuerdos.forEach{ recuerdo => recuerdo.descripcionContiene(keyWord)}
    self.enviarAMemoriaDeCortoPlazo()
    self.controlHormonal()
    self.aumentarFelicidad(100)
    self.liberarRecuerdos()
  }

  method recuerdosNoCentralesYNoNegados() = recuerdos.filter{ recuerdo => !emocionDominante.negarA(recuerdo) }
  method enviarAMemoriaDeCortoPlazo() { memoriaDeLargoPlazo.addAll(self.recuerdosNoCentralesYNoNegados()) }

  method controlHormonal() { // ME TIRA ERROR CUANDO QUIERO HACER UN METODO PARA LA CONDICION DEL IF, NO SE QUE ONDA
    if(self.todoRecuerdoPresentaMismaEmocionDominante() || self.hayPensamientoCentralEnMemoriaLargoPlazo()) {
      self.disminuirFelicidad(15)
      self.perderLosTresPensamientosCentralesMasAntiguos()
    }
  }

  method hayPensamientoCentralEnMemoriaLargoPlazo() = pensamientosCentrales.any{pensamientoCentral => memoriaDeLargoPlazo.contains(pensamientoCentral)}
  method todoRecuerdoPresentaMismaEmocionDominante() = recuerdos.all{ recuerdo => recuerdo.emocionDominanteEs(self.emocionDominanteDeUnRecuerdo()) }
  method emocionDominanteDeUnRecuerdo() = recuerdos.anyone().emocionDominante()
  method perderLosTresPensamientosCentralesMasAntiguos() { 
    pensamientosCentrales.sortBy{ pc1, pc2 => pc1.fecha() > pc2.fecha() }.drop(3)
  }

  method restauracionCognitiva() { self.aumentarFelicidad(100) }

  method aumentarFelicidad(cantidad) { nivelDeFelicidad = 10000.min(nivelDeFelicidad + cantidad) }

  method liberarRecuerdos() { recuerdos.clear() }

  method rememorarRecuerdo() = memoriaDeLargoPlazo.any{ recuerdo => self.condicionDeRememoracion(recuerdo) }

  method condicionDeRememoracion(unRecuerdo) = unRecuerdo.fecha() > edad / 2

  method cantidadRecuerdosDeLargoPlazoRepetidos() = 
    memoriaDeLargoPlazo.max{ recuerdo => memoriaDeLargoPlazo.ocurrencesOf(recuerdo)}

  method tieneDejaVu() = memoriaDeLargoPlazo.occurrencesOf(self.rememorarRecuerdo()) > 1 // Debe haber algun method para listas q lo haga

}

