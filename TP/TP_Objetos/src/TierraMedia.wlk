class Camino {
    const property zonas = []

    method puedeCruzar(unGrupo) = zonas.all{zona => zona.cumpleRequerimiento(unGrupo)}
}

object belfalas {
    method cumpleRequerimiento(unGrupo) = true
}

object lebennin {
    method puedePasar(unGuerrero) = unGuerrero.poder() > 1500 
    method recorrer(unGuerrero) { unGuerrero.perderVida(10) }

    method cumpleRequerimiento(unGrupo) = unGrupo.tieneAlguienConPoder(1500)
}

object minasTirith {
    method puedePasar(unGuerrero) = unGuerrero.tieneAlgunArma()
    method recorrer(unGuerrero) { }

    method cumpleRequerimiento(unGrupo) = unGrupo.tiene(lembas, 10)
}

object bosqueDeFangorn {
    method cumpleRequerimiento(unGrupo) = unGrupo.algunoTieneArma()
}

object edoras {
    method cumpleRequerimiento(unGrupo) = true
}

object estemnet {
    method cumpleRequerimiento(unGrupo) = unGrupo.tiene(capaElfica, 3)
}

object lembas { }
object capaElfica { }




















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
