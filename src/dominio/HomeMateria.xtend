package dominio


import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;
import java.util.List
import java.util.ArrayList

@Observable

class HomeMateria extends CollectionBasedHome<Materia>{
	
	new() {
		this.init
	}
	
	def void init() {
		
		this.create("Discreta")
		this.create("Algoritmos")
//		this.crear("Discreta")
	}
	
	
	def void create(String string) {
		var materia = new Materia
		materia.nombreMateria = string
		this.create(materia)
	}
	
	def search(){
		allInstances
	}

	override protected Predicate<Materia> getCriterio(Materia example) {
		null
	}
	
	override createExample() {
		new Materia
	}
	
	override getEntityType() {
		typeof (Materia)
	}

}