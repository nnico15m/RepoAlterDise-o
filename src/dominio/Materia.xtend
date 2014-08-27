package dominio

import org.uqbar.commons.model.Entity
import java.util.ArrayList
import java.util.List

@org.uqbar.commons.utils.Observable


	class Materia  extends Entity implements Cloneable{
	
		@Property int fecha
		@Property String nombreMateria
		@Property int anioCursada
		@Property Boolean finalAprobado
		@Property String profesor
		@Property Nivel ubicacionMateria
		@Property List<EditorNota> notas = new ArrayList<EditorNota>
		@Property EditorNota nota
	
	def search(){
		
		notas = new ArrayList<EditorNota>
	
	}
	
	override clone() {
		super.clone()
	}
	
	def agregaNota(EditorNota nota) {
		notas.add(nota)
	}
	
	def borraTuNota() {
		notas.remove(nota)
	}
	
	}
	