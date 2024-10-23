class SuperComputadora {
  const equipos = #{}
  var totalDeComplejidadResuelta = 0

  method equiposActivos() = equipos.filter{equipo => equipo.estaActivo()}

  method estaActivo() = true
  method computo() = self.sumaTotalDe{equipoActivo => equipoActivo.computo()}
  method consumo() = self.sumaTotalDe{equipoActivo => equipoActivo.consumo()}

  method malConfigurada() = 
    self.equipoActivoQueMas{equipo => equipo.consumo()} != 
    self.equipoActivoQueMas{equipo => equipo.computo()} 

  method computarProblema(cantidadAComputar) {
    self.equiposActivos().forEach{ equipo => equipo.computarProblema(self.complejidadParticionada(cantidadAComputar))}
    totalDeComplejidadResuelta += cantidadAComputar
  }
  
  method complejidadParticionada(cantidadAComputar) = cantidadAComputar / self.equiposActivos().size()
  
  method equipoActivoQueMas(criterio) = self.equiposActivos().max(criterio)
  method sumaTotalDe(criterio) = self.equiposActivos().sum(criterio)
}

class Equipo {
  const configuracion
  var property quemado = false

  method estaActivo() = !quemado && self.computo() > 0

  method consumoPorConfiguracion() = configuracion.consumo()
  method computoPorConfiguracion() = configuracion.computo()

  method computarProblema(cantidadDeComputo) {
    self.verificacionDeComputo(cantidadDeComputo)
    configuracion.realizarComputo(self)
  } 

  method verificacionDeComputo(cantidadDeComputo) {
    if(cantidadDeComputo > self.computo())
      throw new DomainException(message = "Computo inaccesible!")
  }

  method verificacionDeQuemadura() {
    if(quemado)
      throw new DomainException(message = "Se quemo el Equipito poronga!")
  }

  method computoConOverclock()
  method consumo()
  method computo()
}

class A105 inherits Equipo {
  override method consumo() = 300
  override method computo() = 600
  override method computoConOverclock() = self.computo() * 1.30

  override method computarProblema(cantidadDeComputo) {
    self.verificacionDeComplejidad(cantidadDeComputo)
    super(cantidadDeComputo)
  }

  method verificacionDeComplejidad(cantidadAComputar) {
    if(cantidadAComputar < 5)
      throw new DomainException(message = "Complejidad demasiado alta!")
  }
}

class B2 inherits Equipo {
  const cantidadDeMicrochips

  override method consumo() = 50 * cantidadDeMicrochips + 10
  override method computo() = 100 * cantidadDeMicrochips.min(800)
  override method computoConOverclock() = self.computo() * 20
}
