
class Ataque {
  const potencia

  method potencia() = potencia
}

class AtaqueFisico inherits Ataque {
  // Como minimo un punto de daño
}

class AtaqueMagico inherits Ataque {
  const elemento

  method elemento() = elemento
}

class Elemento {
  const elementoDebilidad

  method esDebilAnte(unElemento) = elementoDebilidad == unElemento
  
  method efectosDeHechizo(unaCriatura, unAtaqueMagico) {
    if(unaCriatura.esDebilAnte(unAtaqueMagico.elemento()))
      unaCriatura.disminuirVida(2 * unAtaqueMagico.potencia())
    else
      unaCriatura.disminuirVida(self.cantidadQueAplica(unAtaqueMagico))
  }

  method cantidadQueAplica(unAtaqueMagico) = if(unAtaqueMagico.elemento() == self) 0 else unAtaqueMagico.potencia()

}

object fuego inherits Elemento (elementoDebilidad = hielo) { }
object hielo inherits Elemento (elementoDebilidad = fuego) { }
object oscuridad inherits Elemento (elementoDebilidad = luz) { }
object luz inherits Elemento (elementoDebilidad = oscuridad) { }

