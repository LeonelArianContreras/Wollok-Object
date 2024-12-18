class Filosofo {
  const nombre
  var edad
  var nivelDeIluminacion
  var diasVividos
  const actividades = []
  const honorificos = []

  method nivelDeIluminacion() = nivelDeIluminacion

  method presentarse() = nombre + honorificos.join(", ")
  method estaEnLoCorrecto() = nivelDeIluminacion > 1000

  method realizarActividades() {
    actividades.forEach{actividad => actividad.consecuencias(self)}
    self.pasarDia()
    self.verificarAnio()
    self.verificarSabio()
  }

  method disminuirNivelDeIluminacion(cantidad) { nivelDeIluminacion -= cantidad }
  method aumentarNivelDeIluminacion(cantidad) { nivelDeIluminacion += cantidad }
  method rejuvenece(cantidad) { diasVividos -= cantidad }
  method pasarDia() { diasVividos += 1 }
  method agregarHonorifico(unHonorifico) { honorificos.add(unHonorifico) }

  method verificarAnio() {
    if(diasVividos % 365 == 0) 
      self.aumentarNivelDeIluminacion(10)
  }

  method verificarSabio() {
    if(diasVividos % (60 * 365) == 0) // De cagon los parentesis
      self.agregarHonorifico("El sabio")
  }

  method vivir(cantidadDeDias) { cantidadDeDias.times{self.realizarActividades()} }

}

class FilosofoContemporaneo inherits Filosofo {
    var esAmanteDeLaBotanica = false

    override method presentarse() = "hola"
    override method nivelDeIluminacion() = if(esAmanteDeLaBotanica) super() else super() * 5
}