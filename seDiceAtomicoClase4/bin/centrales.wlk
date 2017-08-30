object centralHidroelectrica{
	
	method produccionDeEnergia(ciudad) = 2*ciudad.caudal()
}

object centralAtomicaBurns{
	
	var cantVarillaDeUranio
	
	method cantVarillaUranio(unaCantidad){
		cantVarillaDeUranio = unaCantidad
	}
	
	method produccionDeEnergia(ciudad) = 0.1*cantVarillaDeUranio
	
	method contaminacion()= cantVarillaDeUranio > 20
	
}

object centralExBosque{	
	
	var capacidad
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	
	method produccionDeEnergia(ciudad) = 0.5 + capacidad*ciudad.riquezaDelSuelo()
	
	method contaminacion() = true
	
}

object centralElSuspiro{
	
	var turbinas = #{turbinaX}
	
	method agregarTu8rbina(nuevaTurbina){
		turbinas.add(nuevaTurbina)
	}
	
	method produccionDeEnergia(ciudad) {
		return turbinas.sum{ turbina => turbina.produccion(ciudad.velocidadVientos())}
	} 
	
	method contaminacion() = false
}

object turbinaX{
	
	method produccion(velocidadDelViento) = 0.2*velocidadDelViento
	
}