
class Partido {
    const property filosofo
    const argumentos = [] // Si los argumentos no irian aca, es absurdo crear una class Partido

    method tieneUnFilosofoEnLoCorrecto() = filosofo.estaEnLoCorrecto()
    method tieneAlMenosLaMitadDeArgumentosEnriquecedores() = self.promedioDeArgumentosEnriquecedores() >= 0.5
    method promedioDeArgumentosEnriquecedores() = argumentos.count{argumento => argumento.esEnriquecedor()} / argumentos.size() 
}

class Discusion {
    const unPartido
    const otroPartido // Como en el punto 5 dice AMBOS, da a entender que es entre dos

    method esBuena() = self.partidosConFilosofosEnLoCorrecto() && self.ambosPartidosConArgumentosEnriquecedores()

    method partidosConFilosofosEnLoCorrecto() = unPartido.tieneUnFilosofoEnLoCorrecto() && otroPartido.tieneUnFilosofoEnLoCorrecto()
    method ambosPartidosConArgumentosEnriquecedores() = unPartido.tieneAlMenosLaMitadDeArgumentosEnriquecedores() && otroPartido.tieneAlMenosLaMitadDeArgumentosEnriquecedores()
}

class Argumento {
    const naturalezas = []
    const descripcion

    method esEnriquecedor() = naturalezas.all{naturaleza => naturaleza.enriquece(self)}
    method descripcionCon(cantidadPalabras) = descripcion.words() == cantidadPalabras
    method descripcionTerminaCon(unCaracter) = descripcion.endsWith(unCaracter)
}

object naturalezaEstoica {
    method enriquece(_) = true
}

object naturalezaMoralista {
    method enriquece(unArgumento) = unArgumento.descripcionCon(10) 
}

object naturalezaEsceptica {
    method enriquece(unArgumento) = unArgumento.descripcionTerminaCon("?")

}

object naturalezaCinica {
    method enriquece(unArgumento) = 0.randomUpTo(100).between(0, 30)
}