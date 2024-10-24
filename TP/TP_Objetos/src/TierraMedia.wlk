object lebennin {
    method puedePasar(unGuerrero) = unGuerrero.poder() > 1500
    method recorrer(unGuerrero) { unGuerrero.perderVida(10) }
}

object minasTirith {
    method puedePasar(unGuerrero) = unGuerrero.tieneAlgunArma()
    method recorrer(unGuerrero) { }
}

object lossarnach {
    method puedePasar(_unGuerrero) = true
    method recorrer(unGuerrero) { unGuerrero.aumentarVida(1) }
}

object gondor {
    var origen = lebennin
    var destino = minasTirith

    method puedePasar(unGuerrero) = origen.puedePasar(unGuerrero) && destino.puedePasar(unGuerrero)
    
    method recorrer(unGuerrero) { 
        origen.recorrer(unGuerrero)
        destino.recorrer(unGuerrero)
    }
}
