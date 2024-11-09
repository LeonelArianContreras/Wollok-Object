import Ataques.*

class Heroe {
    var mana
    const fuerza
    var llaveEspada

    method mana() = mana
    method fuerza() = fuerza

    method disminuirMana(cantidad) = { mana -= cantidad }

    method ataqueFisicoA(unaCriatura) { 
        unaCriatura.recibirAtaqueFisico(
            new AtaqueFisico(potencia = self.calculoDePoderFisico()))
    }

    method calculoDePoderFisico() = llaveEspada.poder() + fuerza

    method ataqueMagicoA(unaCriatura, unHechizo) {
        if(self.tieneManaSuficiente(unHechizo)) {
            unaCriatura.recibirHechizo(unHechizo)
            self.disminuirMana(unHechizo.poderBase())
        }
    }

    method descansar() { mana += 30}
    method cambiarLlaveEspada(nuevaLlaveEspada) { llaveEspada = nuevaLlaveEspada }
    method tieneManaSuficiente(unHechizo) = self.mana() >= unHechizo.potencia() 
}

class LlaveEspada {
    const poderFisico
    const poderMagico
    
    method poderFisico() = poderFisico
    method poderMagico() = poderMagico
}