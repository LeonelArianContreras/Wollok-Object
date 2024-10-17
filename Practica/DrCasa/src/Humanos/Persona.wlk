class Persona {
    const enfermedades = []
    var temperatura
    var celulasDelCuerpo
    const grupoSanguineo

    method contraer(unaEnfermedad) {
        enfermedades.add(unaEnfermedad)
    }

    method cantidadCelulas() = celulasDelCuerpo

    method tiene(unaEnfermedad) = enfermedades.contains(unaEnfermedad)

    method vivirUnDia() {
        enfermedades.forEach{enfermedad => enfermedad.afectarA(self)} // Es un iterador de toda la vida
    }

    method vivir(unosDias) {
        unosDias.times{_ => self.vivirUnDia()}
    }

    method aumentarTemperatura(unosGrados) {
        temperatura = 45.min(temperatura + unosGrados)
    }

    method destruirCelulas(unasCelulasAmenazantes) {
        celulasDelCuerpo -= unasCelulasAmenazantes
    }

    method cantidadDeCelulasAfectadasPorEnfermedadesAgresivas() = self.enfermedadesAgresivas().sum { enfermedad => enfermedad.cantidadCelulasAmenazadas()}

    method enfermedadesAgresivas() = enfermedades.filter{enfermedad => enfermedad.esAgresivaPara(self)}

    method enfermedadMasChupadoraDeCelulas() = enfermedades.max{enfermedad => enfermedad.cantidadCelulasAmenazadas()}

    method estaEnComa() = temperatura == 45 || celulasDelCuerpo < 1000000

    method recibirMedicamento(unaDosis) {
        enfermedades.forEach{enfermedad => enfermedad.atenuarse(unaDosis * 15)}
        self.removerEnfermedadCurada()
    }

    method removerEnfermedadCurada() {
        enfermedades.removeAllSuchThat{ enfermedad => enfermedad.enfermedadCurada()}
    }

    method grupoSanguineo() = grupoSanguineo

    method donarA(unaPersona, cantidadDeCelulasADonar) {
        self.verificarCondicionesDeDonacion(unaPersona, cantidadDeCelulasADonar)

        celulasDelCuerpo -= cantidadDeCelulasADonar
        unaPersona.aumentarCelulas(cantidadDeCelulasADonar)
    }

    method tieneSuficientesCelulas(cantidadDeCelulasADonar) = cantidadDeCelulasADonar > 500 && self.cantidadCelulas() / 4 <= cantidadDeCelulasADonar

    method esCompatibleCon(unaPersona) = grupoSanguineo.esCompatibleCon(unaPersona.grupoSanguineo())

    method aumentarCelulas(celulasDonadas) {
        celulasDelCuerpo += celulasDonadas
    }

    method verificarSuficienciaDeCelulas(cantidadDeCelulasADonar) {
        if(!self.tieneSuficientesCelulas(cantidadDeCelulasADonar)) {
            throw new DomainException(message = "¡Vas a morirte si donas papá!")
        }
    }

    method verificarCompatibilidadCon(unaPersona) {
        if(!self.esCompatibleCon(unaPersona)) {
            throw new DomainException(message = "¡Sos mas incompatible que ésta con ella!")
        }
    }

    method verificarCondicionesDeDonacion(unaPersona, cantidadDeCelulasADonar) {
        self.verificarCompatibilidadCon(unaPersona)
        self.verificarSuficienciaDeCelulas(cantidadDeCelulasADonar)
    }
}
