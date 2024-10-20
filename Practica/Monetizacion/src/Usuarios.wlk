class Usuario {
  const property nombre
  const property email
  var verificado = false
  const contenidos = #{}

  method verificar() { verificado = true}
  method verificado() = verificado

  method subirContenido(unContenido) { contenidos.add(unContenido) }

  method saldoTotal() = contenidos.sum{contenido => contenido.recaudar()}

  method esSuperUsuario() = contenidos.count{contenido => contenido.esPopular()} >= 10

  method publicar(unContenido, unaMonetizacion) {
    contenidos.add(unContenido)
  }
}
