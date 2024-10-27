import Armas.*

class Grupo {
    const property guerreros = []

    method puedeRecorrer(unCamino) = unCamino.puedeCruzar(self)
    method recorrer(unCamino) { 
        unCamino.atravesar(self) 
        guerreros.removeAllSuchThat{guerrero => !guerrero.estaEnCombate()}
    }

    method tiene(item, cantidad) = self.contarItem(item) == cantidad

    method contarItem(item) = 
        guerreros.map{guerrero => guerrero.cantidadDe(item)}.sum()

    method tieneAlguienConPoder(unPoder) = guerreros.any{guerrero => guerrero.poder() >= unPoder}
    
    method algunoTieneArma() = guerreros.any{guerrero => guerrero.tieneAlgunArma()}

    method agregarItem(unItem) {
        self.afectar{guerrero => guerrero.agregarItem(unItem)}
    }

    method perderItem(unItem) {
        self.afectar{guerrero => guerrero.removerItem(unItem)}
    }

    method incrementarVida(cantidad) {
        self.afectar{guerrero => guerrero.aumentarVidaMultiplicando(cantidad)}
    }

    method perderVida(cantidad) {
        self.afectar{guerrero => guerrero.perderVida(cantidad)}        
    }

    method afectar(criterio) {
        guerreros.forEach(criterio)
    }
}

class Guerrero {
    var property cantidadDeVida = 100
    const armas = []
    const items = []
    var enCombate = true

    method poder()

    method cantidadDe(item) = items.occurrencesOf(item)
    method tieneItem(item) = items.contains(item)
    method tieneArma(arma) = arma.contains(arma)
    method agregarArma(arma) { armas.add(arma) }
    method agregarItem(item) { items.add(item) }
    method tieneAlgunArma() = !armas.isEmpty()
    method removerItem(item) { items.remove(item) }

    method poderTotalDeArmas() = armas.sum{arma => arma.poder()}
    method calculoDePoder(cantidadAMultiplicar) = cantidadDeVida * cantidadAMultiplicar + self.poderTotalDeArmas() * 2

    method aumentarVida(cantidad) { cantidadDeVida += cantidad } // Acordarse que tiene q ser 0-100
    method aumentarVidaMultiplicando(cantidad) { cantidadDeVida *= cantidad}
    method perderVida(cantidad) { 
        cantidadDeVida -= cantidad 
        self.verificarVida(cantidadDeVida)
    }

    method verificarVida(cantidadDeVidaActual) {
        if(cantidadDeVidaActual <= 0)
            enCombate = false
    }

    method estaEnCombate() = enCombate

    method atravesar(zona) {
        if(self.puedeAtravesar(zona))
            zona.recorrer(self)
    }
    method puedeAtravesar(zona) = zona.puedePasar(self)    
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