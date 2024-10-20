class Contenido {
  var property ofensivo = false
  const titulo
  var cantidadDeVistas
  var monetizacion

  method cantidadDeVistas() = cantidadDeVistas
  method recaudar() = monetizacion.recaudar(self)
 
  method monetizacion(unaMonetizacion) {
    self.verificacionDePublicacion()
    monetizacion = unaMonetizacion
  }

  method initialize() {
    self.verificacionDePublicacion()
  }

  method verificacionDePublicacion() {
    if(!monetizacion.puedePublicar(self))
      throw new DomainException(message = "¡No se acepta dicha forma de monetaizacion!")
  }

  method puedeAlquilarse()
  method esPopular()
  method recaudacionMaximaPara(unContenido)

}

class Videos inherits Contenido {
  
  override method esPopular() = cantidadDeVistas > 10000

  override method recaudacionMaximaPara(unContenido) = 10000

  override method puedeAlquilarse() = true
}

const tagsDeModa = ["Minas", "MilicaErome", "League Of Legends"]

class Imagen inherits Contenido { 
  const tags = #{}

  override method esPopular() = tagsDeModa.all{tagDeModa => tags.contains(tagDeModa)}

  override method recaudacionMaximaPara(unContenido) = 4000

  override method puedeAlquilarse() = false
}

object publicidad {
  method recaudar(unContenido) = 
    self.calculoDeRecaudacion(unContenido).min(unContenido.recaudacionMaximaPara(unContenido))

  method calculoDeRecaudacion(unContenido) = 
    unContenido.cantidadDeVistas() * 0.05 + if(unContenido.esPopular(unContenido)) 2000 else 0

  method puedePublicar(unContenido) = !unContenido.ofensivo()
}

object donacion {
  var cantidadDeDonaciones = 0

  method recaudar(unContenido) {}

  method puedePublicar(unContenido) = true
}

class Descarga {
  const precio

  method precio() = precio

  method recaudar(unContenido) = unContenido.cantidadDeVistas() * precio

  method puedePublicar(unContenido) = unContenido.esPopular()
}

class Alquiler inherits Descarga {

  override method precio() = 1.max(super())
  override method puedePublicar(unContenido) = super(unContenido) && unContenido.puedeAlquilarse()
}