class Recuerdo {
  const descripcion
  const fecha = new Date()
  const emocionDominante

  method fecha() = fecha

  method afectarA(unaPersona) {
    emocionDominante.afectarPorEmocion(unaPersona)
  }

  method esDificilDeExplicar() = descripcion.words() > 10 

  method descripcionContiene(keyWord) = descripcion.contains(keyWord)

  method esEmocionDominante(unaEmocion) = unaEmocion == emocionDominante

  method tieneEmocionAlegre() = emocionDominante.esAlegre()

}
