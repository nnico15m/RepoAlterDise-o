package dominio
import org.uqbar.commons.utils.Observable

@Observable

class EditorNota {
	
	@Property int fecha
	@Property String descripcion
	@Property Boolean aprobado = false
	
	def convertir() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override def String toString() {
		
		var result = new StringBuffer
		
		result.append(if (this.aprobado) " - recibe resumen" else " - no recibe resumen")
		result.toString
	}
	
}