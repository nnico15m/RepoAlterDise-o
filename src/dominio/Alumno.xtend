package dominio

import org.uqbar.commons.utils.Observable
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.ApplicationContext

@org.uqbar.commons.utils.Observable

class Alumno  {
	
	@Property List<Materia> materias
	@Property Materia materia
	
	
	
	def search() {
		
		materias = new ArrayList<Materia>
		materias = getHomeMaterias().search()
		materia = getHomeMaterias().alguno()
	}
	
	def HomeMateria getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
	def borraTuNota(){
		materia.borraTuNota()
	}
/*	
	def dameTuInformacion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def agregarMateria(Materia materia){
		materias.add(materia)
	}
*/	
}