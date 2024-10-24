class Espada {
    var property multiplicador
    var property origen

    method poder() = origen.poderExtra() * multiplicador
}

object baculo {
    var property poder = 400
}

class Daga inherits Espada {
    override method poder() = super() / 2 
}

class ArmaPrehistorica {
    var property kilogramos
    const longitud

    method poder() = kilogramos * longitud
}

class Arco inherits ArmaPrehistorica{
    override method poder() = super() / 10
}

object origenElfico {
    method poderExtra() = 25
}

object origenEnano {
    method poderExtra() = 20
}

object origenHumano {
    method poderExtra() = 15
}
