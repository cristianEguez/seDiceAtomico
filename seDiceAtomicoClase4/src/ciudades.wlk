import centrales.*

object springfield{
	
	var necesidadDeEnergia
	var centrales = #{centralAtomicaBurns,centralExBosque,centralElSuspiro}
	
	method centralMasPotente() = centrales.max{ central => central.produccionDeEnergia(self)}
	
	method estaEnElHorno() = self.todasLasCentralesContaminan() or self.aporteContaminanteMayorQue(0.5)
	
	method aporteContaminanteMayorQue(porcentaje) = self.produccionDeCentralesContaminantes() > porcentaje*necesidadDeEnergia
	
	method produccionDeCentralesContaminantes()= self.centralesContaminantes().sum{central => central.produccionDeEnergia(self)}
	
	method todasLasCentralesContaminan() = centrales.all{ central => central.contaminacion()} 
	
	method cubrioSusNecesidades() = self.suministroTotal() - necesidadDeEnergia >= 0
	
	method suministroTotal() = centrales.sum{ central => central.produccionDeEnergia(self)}
	
	method necesidadDeEnergia(cantidadEnMillones) {
		necesidadDeEnergia = cantidadEnMillones
	}
	
	method centralesContaminantes() = centrales.filter{ central => central.contaminacion()}
	
	method velocidadVientos() = 10
	method riquezaDelSuelo() = 0.9
}

object albuquerque{

	var centrales = #{centralHidroelectrica}

	method caudal() = 150
	
	method centralMasPotente() = centrales.max{ central => central.produccionDeEnergia(self)}
	
}
