class Enfermedad {
    var cantidadCelulasAmenazadas

    method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas

    method atenuarse(unaDosis) {
        cantidadCelulasAmenazadas -= unaDosis
    }

    method enfermedadCurada() = self.cantidadCelulasAmenazadas() <= 0

    method afectarA(unaPersona)
    method esAgresivaPara(unaPersona)
}

class EnfermedadInfecciosa inherits Enfermedad {
    method reproducirse() {
        cantidadCelulasAmenazadas *= 2
    }

    override method afectarA(unaPersona) {
        unaPersona.aumentarTemperatura(cantidadCelulasAmenazadas / 1000)
    }
    override method esAgresivaPara(unaPersona) = cantidadCelulasAmenazadas > unaPersona.cantidadCelulas() * 0.10

}

class EnfermedadAutoinmune inherits Enfermedad {
    var cantidadDeAfecciones = 0

    override method afectarA(unaPersona) {
        unaPersona.destruirCelulas(cantidadCelulasAmenazadas)
        self.aumentarCantidadDeAfecciones()
    }

    method cantidadDeAfecciones() = cantidadDeAfecciones
    method aumentarCantidadDeAfecciones() { cantidadDeAfecciones += 1 }

    override method esAgresivaPara(_unaPersona) = cantidadDeAfecciones > 30
}

class EnfermedadInfecciosaEAutoinmune {
    const autoinmune
    const infecciosa

    method reproducirse() {
        infecciosa.reproducirse()
    }

    method esAgresivaPara(unaPersona) = autoinmune.esAgresivaPara(unaPersona) && infecciosa.esAgresivaPara(unaPersona)

    method afectarA(unaPersona) {
        infecciosa.afectarA(unaPersona)
        autoinmune.afectarA(unaPersona)
    }

    method atenuarse(unaDosis) {
        infecciosa.atenuarse(unaDosis)
        autoinmune.atenuarse(unaDosis)
    }

    method enfermedadCurada() = infecciosa.enfermedadCurada() && autoinmune.enfermedadCurada()
}