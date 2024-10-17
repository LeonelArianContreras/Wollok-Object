import Persona.*

class JefeDepto inherits Persona {
    const subordinados = #{}

    method agregarSubordinado(unoQueAtiende) {
        subordinados.add(unoQueAtiende)
    }

    method subordinaA(unSubordinado) = subordinados.contains(unSubordinado)

    method atenderA(unaPersona) {
        subordinados.anyOne().atenderA(unaPersona)
    }
}