import Armas.*

class Grupo {
    const guerreros = []
}

class Guerrero {
    var property cantidadDeVida = 100
    const armas = []
    const items = []

    method agregarArma(arma) = armas.add(arma)
    method tieneAlgunArma() = !armas.isEmpty()

    method poderTotalDeArmas() = armas.sum{arma => arma.poder()}
    method calculoDePoder(cantidadAMultiplicar) = cantidadDeVida * cantidadAMultiplicar + self.poderTotalDeArmas() * 2

    method aumentarVida(cantidad) { cantidadDeVida += cantidad }
    method perderVida(cantidad) { cantidadDeVida -= cantidad }

    method atravesar(zona) {
        if(self.puedeAtravesar(zona))
            zona.recorrer(self)
    }

    method puedeAtravesar(zona) = zona.puedePasar(self)

    method poder()
}

class Hobbit inherits Guerrero {
    override method poder() = cantidadDeVida + self.poderTotalDeArmas() + items.size()
}

class Enano inherits Guerrero {
    const factorDePoder

    override method poder() = cantidadDeVida + factorDePoder * self.poderTotalDeArmas()
}

class Elfo inherits Guerrero {
    const destrezaBase = 2
    var property destrezaPropia

    override method poder() = cantidadDeVida + self.poderTotalDeArmas() * (destrezaBase + destrezaPropia)
}

class Humano inherits Guerrero {
    const limitadorDePoder

    override method poder() = cantidadDeVida * self.poderTotalDeArmas() / limitadorDePoder
}

class Maiar inherits Guerrero {
    const factorPoderBasico
    const factorPoderAmenaza

    override method poder() = if(cantidadDeVida < 10) self.calculoDePoder(factorPoderBasico) else self.calculoDePoder(factorPoderAmenaza)
}

object gollum inherits Hobbit {
    override method poder() = super() / 2
}

object tomBombadil inherits Guerrero {

    override method poder() = 10000000
    override method puedeAtravesar(zona) = true
    override method atravesar(zona) { zona.recorrer(self) }

    override method aumentarVida(cantidad) { }
    override method perderVida(cantidad) { }
}