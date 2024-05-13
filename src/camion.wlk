import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	method cargar(cosa){
		cosas.add(cosa)
		cosa.consecuenciaCarga()
	}
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
	}
	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
	method elDeNivel(nivel){
		return cosas.find({cosa => cosa.peligrosidad() == nivel})
	}
	method pesoTotal(){
		return tara + self.sumaPesoCosas()
	}
	method sumaPesoCosas(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method excedidoDePeso(){
		return 2500 < self.pesoTotal()
	}
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({cosa => cosa.peligrosidad() > nivel })
	}
	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return !self.excedidoDePeso() &&
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa=> cosa.peso().between(min,max)})
	}
	method cosaMasPesada(){
		return cosas.max({cosa=> cosa.peso()})
	}
	method pesos(){
		return cosas.map({cosa=>cosa.peso()})
	}
	
	// PARTE "2
	method totalBultos(){
		return cosas.sum({cosa=>cosa.bultos()})
	}
	
	
	
}