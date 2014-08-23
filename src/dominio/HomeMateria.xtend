package dominio


import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;
import java.util.List
import java.util.ArrayList
import interfazVentanaNueva.EditorNotaWindows
import org.uqbar.arena.windows.SimpleWindow

@Observable

class HomeMateria extends CollectionBasedHome<Materia>{
	
	new() {
		this.init
	}
	
	def void init() {
		
		this.create("Matematica Discreta")
		this.create("Algoritmos")
		this.create("Analisis I")
		this.create("Analisis de Sistemas")
		this.create("Ingenieria y Sociedad")
		this.create("Algebra")
		this.create("Quimica")
		this.create("Fisica I")	
		this.create("Fisica II")
		this.create("Sistemas Operativos")
		this.create("Redes")
		this.create("Arquitectura")
		this.create("Sintaxis")
		this.create("Diseño")
	
	
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