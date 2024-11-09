class Criatura {
  var vida
  const defensa
  const raza
  const elemento

  method disminuirVida(cantidad) {
    vida -= cantidad
    0.max(vida)
  }

  method vida() = vida
  method defensa() = defensa

  method recibirAtaqueFisico(unAtaque) { raza.efectosDeAtaque(self, unAtaque) }
  method recibirAtaqueMagico(unAtaque) { elemento.efectosDeHechizo(self, unAtaque) }

  method esDebilAnte(unElemento) = elemento.esDebilAnte(unElemento)
}

object razaIncorporea {

  method efectosDeAtaque(unaCriatura, unAtaque) { unaCriatura.disminuirVida(1.max(self.calculoDeEfectos(unaCriatura, unAtaque))) }
  method calculoDeEfectos(unaCriatura, unAtaque) = unAtaque.potencia() - unaCriatura.defensa()

}

object razaSinCorazon {

  method efectosDeAtaque(unaCriatura, unAtaque) { unaCriatura.disminuirVida(1.max(0.90 * unAtaque.potencia()))}

}
