import Armas.*
import Rangos.*
class Persona {
    var property estaVivo = true
    var property estaHerido = false
    var lealtad
    var rango
    const armas = []

    method atacarA(unaPersona) { rango.atacar(self, unaPersona)}
    method armaMasCercana() = armas.take(1)

    method cantidadDeArmas() = armas.size()
    method agregarArma(unArma) { armas.add(unArma) }
    method tieneArmaSutil() = armas.any{arma => arma.esSutil()}

    method aumentarLealtad(cantidad) { lealtad *= cantidad } 

    method ascenderASubjefe() { rango = new Subjefe(subordinados = []) }
    method ascenderADon(anterioresSubordinados) { rango = new Don(subordinados = anterioresSubordinados)}
    
    method sabeDespacharElegantemente()
}

class Famiglia {
    const miembros = []
    const historialDeTraiciones = []
    
    method miembrosVivos() = miembros.filter{miembro => miembro.estaVivo()}

    method elMasPeligroso() = self.miembrosVivos().max{miembro => miembro.cantidadDeArmas()}

    method distribuirArmas() {
        self.miembrosVivos().forEach{miembro => miembro.agregarArma(revolverCon6Balas) }
    }

    method ataqueSorpresaA(unaFamilia) {
        self.miembrosVivos().forEach{miembro => miembro.atacar(unaFamilia.elMasPeligroso())}
    }

    method estanTodosMuertos() = self.miembrosVivos().isEmpty()

    method reorganizarse() {
        self.asuncionASubjefe()
        self.asuncionADon()
        self.aumentarLealtad()
    }

    method asuncionASubjefe() {
        self.soldadosVivos().filter{soldado => soldado.cantidadDeArmas() > 5}.
        forEach{soldado => soldado.ascenderASubjefe()}
    }

    method soldadosVivos() = self.miembrosVivos().filter{miembro => miembro.esSoldado()}

    method asuncionADon() {
        const subordinadoConMasLealtad = self.miembrosVivos().max{miembro => miembro.lealtad()}
        const antiguoDon = self.miembrosVivos().find{miembro => miembro.esElDon()}
        subordinadoConMasLealtad.ascenderADon(antiguoDon.subordinados())
    }

    method aumentarLealtad() {
        self.miembrosVivos().forEach{miembro => miembro.aumentarLealtad(1.10)}
    }

    method lealtadPromedio() =
        self.miembrosVivos().sum{miembro => miembro.lealtad()} / self.miembrosVivos().size()

    method serAtacadaPor(unTraidor) {
        self.miembrosVivos().forEach{miembro => unTraidor.atacarA(miembro)}
    }

    method abandonar(unaPersona) {
        miembros.remove(unaPersona)
    }

    method unirse(unaPersona) {
        miembros.add(unaPersona)
    }
}

