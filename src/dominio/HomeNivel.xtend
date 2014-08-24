package dominio


import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;

@Observable

class HomeNivel extends CollectionBasedHome<Nivel>{
	
	new() {
		this.init
	}
	
	def void init() {
		
		this.create("Nivel 1")
		this.create("Nivel 2")
		this.create("Nivel 3")
		this.create("Nivel 4")
		this.create("Nivel 5")
	
	}
	
	def void create(String nivelMat) {
		var nivel = new Nivel
		nivel.nombreNivel = nivelMat
		this.create(nivel)
	}
	

	def search(){
		allInstances
	}
	
	def alguno(){
		allInstances.get(0)
	}

	override protected Predicate<Nivel> getCriterio(Nivel example) {
		null
	}
	
	
	override createExample() {
		new Nivel
	}
	
	override getEntityType() {
		typeof (Nivel)
	}

}