class Traicion {
    const traidor
    var fechaDeEjecucion
    const victimas = []

    method postergarFecha(nuevaFecha, nuevaVictima) {
        fechaDeEjecucion = nuevaFecha
        victimas.add(nuevaVictima)
    }

    method concretarPlan(unaFamilia, otraFamilia) {
        if(self.puedeConcretarse(unaFamilia))
            self.atacarAVictimas()
            self.cambiarDeFamilia(unaFamilia, otraFamilia)
    }

    method atacarAVictimas() {
        victimas.forEach{victima => traidor.atacarA(victima)}
    }

    method cambiarDeFamilia(unaFamilia, otraFamilia) {
        unaFamilia.abandonar(traidor)
        otraFamilia.unirse(traidor)
    }

    method puedeConcretarse(unaFamilia) = unaFamilia.lealtadPromedio() > 2 * traidor.lealtad()

}