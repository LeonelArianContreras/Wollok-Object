class GrupoSanguineo {
    const tipo
    const factor

    method tipo() = tipo
    method factor() = factor

    method esCompatibleCon(unGrupoSanguineo) = tipo.puedeDonarleA(unGrupoSanguineo.tipo()) && factor.puedeDonarleA(unGrupoSanguineo.factor())
}

object a {
    method puedeDonarleA(tipo) = [self, ab].contains(tipo)
}

object b {
    method puedeDonarleA(tipo) = [self, ab].contains(tipo)
}

object o {
    method puedeDonarleA(tipo) = [self, ab, a, b].contains(tipo)
}

object ab {

}

object factorPositivo {
    method puedeDonarleA(factor) = factor == self
}

object factorNegativo {
    method puedeDonarleA(factor) = true
}