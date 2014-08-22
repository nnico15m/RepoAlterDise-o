package dominio

import org.uqbar.commons.utils.Observable
import java.io.Serializable
import java.util.ArrayList
import java.util.List

@org.uqbar.commons.utils.Observable

class Alumno  {
	
	@Property List<Materia> materias
	
	def search() {
		
		materias = new ArrayList<Materia>
		
	}
	
}