package dominio


import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;
import java.util.List

@Observable

class HomeNivel extends CollectionBasedHome<Nivel>{
	
	new() {
		this.init
	}
	
	def void init() {
		
		this.create("Anual 1 - Nivel")
		this.create("1er Cuatrimestre 1 - Nivel")
		this.create("2do Cuatrimestre 1 - Nivel")
		this.create("Anual 2 - Nivel")
		this.create("1er Cuatrimestre 2 - Nivel")
		this.create("2do Cuatrimestre 2 - Nivel")
		this.create("Anual 3 - Nivel")
		this.create("1er Cuatrimestre 3 - Nivel")
		this.create("2do Cuatrimestre 3 - Nivel")
		this.create("Anual 4 - Nivel")
		this.create("1er Cuatrimestre 4 - Nivel")
		this.create("2do Cuatrimestre 4 - Nivel")
		this.create("Anual 5 - Nivel")
		this.create("1er Cuatrimestre 5 - Nivel")
		this.create("2do Cuatrimestre 5 - Nivel")
	
	}
	
	def void create(String nivelMat) {
		var nivel = new Nivel
		nivel.nombreNivel = nivelMat
		this.create(nivel)
	}
	
	def List<Nivel> getNiveles() {
		allInstances	
	}
	
	def Nivel get(String unNivel) {
		niveles.findFirst [ nivel | nivel.nombreNivel.equals(unNivel) ]
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