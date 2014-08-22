package dominio
import org.uqbar.commons.utils.Observable

@Observable

class EditorNota {
	
	@Property int fecha
	@Property String descripcion
	
	def convertir() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}