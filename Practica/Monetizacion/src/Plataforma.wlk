object plataforma {
    const usuarios = #{}

    method emailsDe(unaCantidadDeUsuarios) =
        usuarios.filter{usuario => usuario.verificado()}.
        sortedBy{unUsuario, otroUsuario => unUsuario.saldoTotal() > otroUsuario.saldoTotal()}.
        take(unaCantidadDeUsuarios).
        map{usuario => usuario.mail()}

    method cantidadSuperUsuarios() = usuarios.count{usuario => usuario.esSuperUsuario()}

}