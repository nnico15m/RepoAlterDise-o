package dominio

import java.util.ArrayList
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import java.util.List

@Observable

class HomeMateria extends CollectionBasedHome<Materia>{
	
	new() {
		this.init
	}
	
	def void init() {
		
		var notasDiscreta = new ArrayList()
		notasDiscreta.add(new EditorNota(1234, "1er parcial", true))
		this.create("Matematica Discreta", 2012, false, "Granado Peralta", "Anual 1 - Nivel", notasDiscreta)
		var notasAlgoritmos = new ArrayList()
		notasAlgoritmos.add(new EditorNota(5678, "TP", false))
		this.create("Algoritmos", 2012, true, "Cuello", "Anual 1 - Nivel", notasAlgoritmos)
/*		this.create("Analisis I")
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
*/
	
	}
	
	def getNivel(String nivel) {
		var niveles = ApplicationContext.instance.getSingleton(typeof(Nivel)) as HomeNivel//.get(nivel)
		niveles.get(nivel)
	}
	
/*	def Nivel get(HomeNivel nivel, String string) {
		nivel.get(string)
	}
*/	

	def void create(String nombre, int anio, Boolean aprobo, String profesor, String ubicacion, List<EditorNota> notas) {
		var materia = new Materia
		materia.nombreMateria = nombre
		materia.anioCursada = anio
		materia.finalAprobado = aprobo
		materia.profesor = profesor
		materia.ubicacionMateria = getNivel(ubicacion)
		materia.notas = notas
		materia.nota = notas.get(0)
		this.create(materia)
	}
	
/*	def void create(String string) {
		var materia = new Materia
		materia.nombreMateria = string
		this.create(materia)
	}
*/	
	def search(){
		allInstances
	}
	
	def alguno(){
		allInstances.get(0)
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