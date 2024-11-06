import Deportes.*

object tomarVino {

  method consecuencias(unFilosofo) {
    unFilosofo.disminuirNivelDeIluminacion(10)
    unFilosofo.agregarHonorifico("El choborra")
  }

}

object juntarseEnElAgora {
  var otroFilosofo = null
  method consecuencias(unFilosofo) {
    unFilosofo.aumentarNivelDeIluminacion(otroFilosofo.nivelDeIluminacion() / 10)
  }

}

object admirarElPaisaje {

  method consecuencias(unFilosofo) { }

}

object meditarBajoUnaCascada {
  const metros = 100
  method consecuencias(unFilosofo) {
    unFilosofo.aumentarNivelDeIluminacion(metros * 10)
  }

}

object practicarUnDeporte {
  var deporte = futbol
  method consecuencias(unFilosofo) {
    unFilosofo.rejuvenecer(deporte.rejuvenece())
  }

}