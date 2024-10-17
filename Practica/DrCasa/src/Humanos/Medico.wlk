import Persona.*

class Medico inherits Persona {
    const dosis

    override method contraer(unaEnfermedad) {
        super(unaEnfermedad)
        self.atenderA(self)
    }

    method atenderA(unaPersona) {
        unaPersona.recibirMedicamento(dosis)
    }
}