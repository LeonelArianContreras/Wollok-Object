import Nave.*

class Troll {

    method votar() { nave.cualquierJugadorNoSospechoso() }
}

class Detective {
    method votar() { nave.jugadorConMasNivelDeSospecha() }
}

class Materialista {
    method votar() { nave.cualquierJugadorSinItems() }
}