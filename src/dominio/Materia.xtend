package dominio

import org.uqbar.commons.model.Entity
import java.util.ArrayList
import java.util.List

@org.uqbar.commons.utils.Observable


	class Materia extends Entity{
	
		@Property String nombreMateria
		@Property int anioCursada
		@Property Boolean finalAprobado
		@Property String profesor
		@Property Nivel ubicacionMateria
		@Property List<EditorNota> notas = new ArrayList(5)
	
	}