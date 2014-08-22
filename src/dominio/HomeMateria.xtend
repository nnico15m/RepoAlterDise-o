package dominio


import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;

@Observable

class HomeMateria {
	
	new() {
		this.init
	}
	
	def void init() {
		
		this.create("Discreta")
		
	}
	
	def void create(String string) {
		var materia = new Materia
		materia.nombreMateria = string
		
		
	}
	
}