
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

    method regalar() = 1000 * self.cantidadDeLenguajesModernos()
    
}

class Desarrollador inherits Persona {
    var programaEnWollok = true

    method esInvitado() = self.esCopado() || self.programaEnWollok() || self.programaEnAlgunLenguajeAntiguo()
    
    method esCopado() = self.programaEnAlgunLenguajeAntiguo() && self.programaEnAlgunLenguajeModerno()

    method programaEnWollok() = programaEnWollok
}

class Infraestructura inherits Persona {

    method esInvitado() = self.cantidadDeLenguajes() >= 5 || self.esCopado()

    method esCopado() = self.experienciaMayorA(10) 
}

class Jefe inherits Persona {
    const subordinados = []

    method esInvitado() = self.condicionDeInvitacion()

    method agregarEmpleado(unEmpleado) { subordinados.add(unEmpleado) }

    method condicionDeInvitacion() = self.programaEnAlgunLenguajeAntiguo() && 
    subordinados.all{ subordinado => subordinado.esCopado() }

    override method tieneLaMesa() = 99
    override method regalar() = super() + 1000 * subordinados.size()
}