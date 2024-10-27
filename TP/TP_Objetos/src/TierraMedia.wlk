class Camino {
    const property zonas = []

    method puedeCruzar(unGrupo) = zonas.all{zona => zona.cumpleRequerimiento(unGrupo)}
    method atravesar(unGrupo) {
        self.verificarCondicionesDeCruce(unGrupo)
        self.validarCamino()
        self.cruzar(unGrupo)
    } 

    method cruzar(unGrupo) {
        zonas.forEach{zona => zona.efecto(unGrupo)}
    }

    method verificarCondicionesDeCruce(unGrupo) {
        if(!self.puedeCruzar(unGrupo))
            throw new DomainException(message = "¡El Grupo No Puede Cruzar!")
    }

    method validarCamino() {
        if(!self.sonLimitrofesLasZonasConsecutivas()) 
            throw new DomainException(message = "¿Donde queres ir?")
    }

    method sonLimitrofesLasZonasConsecutivas() =
        zonas.all{unaZona, otraZona => unaZona.esLimitrofeDe(otraZona) && otraZona.esLimitrofeDe(unaZona)}

}

class Zona {
    const zonasLimitrofes = []
    method esLimitrofeDe(zona) = zonasLimitrofes.contains(zona)

    method cumpleRequerimiento(unGrupo)
    method efecto(unGrupo)
}

object belfalas inherits Zona(zonasLimitrofes = [lebennin, lamedon]){

    override method cumpleRequerimiento(unGrupo) = true
    override method efecto(unGrupo) { unGrupo.agregarItem(lembas) }
}

object lamedon inherits Zona(zonasLimitrofes = [edoras, belfalas]) {

    override method cumpleRequerimiento(unGrupo) = true // No dice nunca nada sobre esta
    override method efecto(unGrupo) { unGrupo.incrementarVida(1.30) }
}

object lebennin inherits Zona(zonasLimitrofes = [belfalas, minasTirith]) {

    method puedePasar(unGuerrero) = unGuerrero.poder() > 1500 
    method recorrer(unGuerrero) { unGuerrero.perderVida(10) }

    override method cumpleRequerimiento(unGrupo) = unGrupo.tieneAlguienConPoder(1500)
    override method efecto(_unGrupo) { }
}

object minasTirith inherits Zona(zonasLimitrofes = [lebennin]) {

    method puedePasar(unGuerrero) = unGuerrero.tieneAlgunArma()
    method recorrer(unGuerrero) { }

    override method cumpleRequerimiento(unGrupo) = unGrupo.tiene(lembas, 10)
    override method efecto(unGrupo) { unGrupo.perderVida(15) }
}

object bosqueDeFangorn inherits Zona(zonasLimitrofes = [edoras, estemnet]) {
    
    override method cumpleRequerimiento(unGrupo) = unGrupo.algunoTieneArma()
    override method efecto(unGrupo) { unGrupo.perderItem(capaElfica) }
}

object edoras inherits Zona(zonasLimitrofes = [bosqueDeFangorn, estemnet, lamedon]) {
 
    override method cumpleRequerimiento(unGrupo) = true
    override method efecto(unGrupo) { unGrupo.agregarItem(botellaDeVinoCaliente)}
}

object estemnet inherits Zona(zonasLimitrofes = [edoras, bosqueDeFangorn]) {
    override method cumpleRequerimiento(unGrupo) = unGrupo.tiene(capaElfica, 3)
    override method efecto(unGrupo) { unGrupo.incrementarVida(2)}
}

object parthGalen inherits Zona {
    override method cumpleRequerimiento(unGrupo) = true
    override method efecto(unGrupo) { unGrupo.perderVida(21)}
}

object lembas { }
object capaElfica { }
object botellaDeVinoCaliente { }



















object lossarnach {
    method puedePasar(_unGuerrero) = true
    method recorrer(unGuerrero) { unGuerrero.aumentarVida(1) }
}

object gondor {
    var property origen = lebennin
    var property destino = minasTirith

    method puedePasar(unGuerrero) = origen.puedePasar(unGuerrero) && destino.puedePasar(unGuerrero)
    
    method recorrer(unGuerrero) { 
        origen.recorrer(unGuerrero)
        destino.recorrer(unGuerrero)
    }
}
