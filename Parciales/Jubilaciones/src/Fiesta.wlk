import Empresa.*

class Fiesta {
    const asistentes = []

    method costo() = 200000 + 5000 * asistentes.size()

    method balance() = self.efectivoRegalado() - self.costo()

    method estaInvitado(unaPersona) {
        if(unaPersona.esInvitado()) {
            asistentes.add(unaPersona)
        }
    }

    method efectivoRegalado() = asistentes.sum{ asistente => asistente.regalarEfectivo() }

    method fiestaExitosa() = self.balance() > 0 && self.todoInvitadoAsistio()

    method todoInvitadoAsistio() = asistentes.size() == empresa.totalDeInvitados()

    method mesas() = asistentes.map{ asistente => asistente.tieneLaMesa() }

    method mesaConMayorAsistencias() = self.mesas().max{ mesa => self.mesas().occurrencesOf(mesa)}

}

class Asistencia {
    const persona
    
    method mesa() = persona.tieneLaMesa()

    method regalarEfectivo() = persona.regalar()
}