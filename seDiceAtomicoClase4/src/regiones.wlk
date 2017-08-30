import ciudades.*

object region{
	
	const ciudadesEnLaRegion = #{springfield,albuquerque}
	
	method centralesMasPotentesDeCadaCiudad() = ciudadesEnLaRegion.map{ciudad => ciudad.centralMasPotente()}
}


