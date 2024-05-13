object knightRider {
	method peso() = 500
	method peligrosidad() = 10
	
	//PARTE 2
	method bultos() = 1
	method consecuenciaCarga(){}
}

object bumblebee {
	var esAuto = true
	method peso() = 800
	method peligrosidad() = if (esAuto) {15} else {30}
	method cambiarEstado() {esAuto = !esAuto}
	//PARTE 2
	method bultos() = 2
	method consecuenciaCarga(){esAuto = false}
}

object paqueteLadrillos{
	var ladrillos = 0
	method peso() = ladrillos * 2
	method peligrosidad() = 2
	method ladrillos(nuevaCantidad){
		ladrillos = 0.max(nuevaCantidad)
	}
	//PARTE 2
	method bultos() = 
	if(ladrillos<= 100){
		1
	} else if (ladrillos.between(101,300)){
		2
	} else
	{3}
	method consecuenciaCarga(){
		self.ladrillos(12)
	}
}


object arena {
	var pesoActual = 0
	method peso() = pesoActual
	method peligrosidad() = 1
	method pesoActual(nuevoPeso){
		pesoActual = 0.max(nuevoPeso)
	}
	//PARTE 2
	method bultos() = 1
	method consecuenciaCarga(){
		self.pesoActual(20)
	}
}

object bateriaAntiarea {
	var estaCargada = true
	method peso() = if (estaCargada){300}else {200}
	method peligrosidad() = if (estaCargada){100}else {0}
	method cambiarEstado() {estaCargada = !estaCargada} 
	//PARTE 2
	method bultos() = if (estaCargada){2}else{1}
	method consecuenciaCarga(){estaCargada = true}
}

object contenedor {
	const contenedor = []
	method peso() = 100 + self.sumaCosas()
	method peligrosidad() =
		 if (contenedor.isEmpty()){
			0
		}
		else {
			contenedor.max({cosa => cosa.peligrosidad()})
		}
	
	method sumaCosas(){
		return contenedor.sum({cosa => cosa.peso()})
	}
	//PARTE 2
	method bultos() = 1 + self.sumaBultosDelContenedor()
	method sumaBultosDelContenedor(){
		return contenedor.sum({cosa=>cosa.bultos()})
	}
	method consecuenciaCarga(){
		contenedor.forEach({cosa=>cosa.consecuenciaCarga()})
	}

}

object residuosRadioactivos {
	var pesoActual = 0
	method peso() = pesoActual
	method peligrosidad() = 200
	method pesoActual(nuevoPeso){
		pesoActual = 0.max(nuevoPeso)
	}
	//PARTE 2
	method bultos() = 1
	method consecuenciaCarga(){
		self.pesoActual(15)
	}
}

object embalajeSeguridad {
	var cosa = paqueteLadrillos
	method peso()= cosa.peso()
	method peligrosidad() = cosa.peligrosidad()/2
	//PARTE 2
	method bultos() = 2
	method consecuenciaCarga(){}
}