import Nave.*
import Items.*

class ReducirOxigeno {
    
    method sabotear(_unJugador) {
        if(!nave.alguienTiene(tuboDeOxigeno))
            nave.disminuirNivelDeOxigeno(10)
    }
}

class ImpugnarJugador {

    method sabotear(unJugador) {
        unJugador.votaEnBlanco()
    }
}