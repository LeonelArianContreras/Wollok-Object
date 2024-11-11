object empresa {
    const property empleados = []

    method empleadosInvitados() = empleados.filter{ empleado => empleado.esInvitado() }

    method totalDeInvitados() = self.empleadosInvitados().size()

}
