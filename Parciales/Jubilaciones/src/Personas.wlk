
class Persona {
    const lenguajes = []
    var experiencia

    method experienciaMayorA(cantidad) = experiencia > cantidad

    method cantidadDeLenguajes() = lenguajes.size()
    method cantidadDeLenguajesModernos() = lenguajes.filter { lenguaje => !lenguaje.esAntiguo() }

    method programaEnAlgunLenguajeAntiguo() = lenguajes.any{ lenguaje => lenguaje.esAntiguo() }
    method programaEnAlgunLenguajeModerno() = !self.cantidadDeLenguajesModernos().isEmpty()

    method aprenderLenguaje(unLenguaje) { lenguajes.add(unLenguaje) }

    method tieneLaMesa() = self.cantidadDeLenguajes()

    method esInvitado() = self.esCopado() || self.cumpleCondicionesDeInvitado()

    method cumpleCondicionesDeInvitado()
    method esCopado()

    method regalar() = 1000 * self.cantidadDeLenguajesModernos()
    
}

class Desarrollador inherits Persona {
    var programaEnWollok = true

    override method cumpleCondicionesDeInvitado() = self.programaEnWollok() || self.programaEnAlgunLenguajeAntiguo()
    
    override method esCopado() = self.programaEnAlgunLenguajeAntiguo() && self.programaEnAlgunLenguajeModerno()

    method programaEnWollok() = programaEnWollok
}

class Infraestructura inherits Persona {

    override method cumpleCondicionesDeInvitado() = self.cantidadDeLenguajes() >= 5

    override method esCopado() = self.experienciaMayorA(10) 
}

class Jefe inherits Persona {
    const subordinados = []

    override method cumpleCondicionesDeInvitado() = self.condicionDeInvitacion()

    method agregarEmpleado(unEmpleado) { subordinados.add(unEmpleado) }

    method condicionDeInvitacion() = self.programaEnAlgunLenguajeAntiguo() && 
    subordinados.all{ subordinado => subordinado.esCopado() }

    override method tieneLaMesa() = 99
    override method regalar() = super() + 1000 * subordinados.size()
    override method esCopado() = false
}