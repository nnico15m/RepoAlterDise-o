package dominio

import org.uqbar.commons.model.Entity

@org.uqbar.commons.utils.Observable

	class Nivel extends Entity{
	
		@Property String nombreNivel
	
	
		override def toString() {
			nombreNivel
		}
			
	}