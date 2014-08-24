package dominio

import org.uqbar.commons.utils.Observable

@Observable

class EditorNota {
	
	@Property int fecha
	@Property String descripcion
	@Property Boolean aprobado //= false
	
	new(int fecha, String descripcion, Boolean aprobado){
		this.fecha = fecha
		this.descripcion = descripcion
		this.aprobado = aprobado
	}
	def convertir() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
/*	override def String toString() {
		
		var result = new StringBuffer
		
		result.append(if (this.aprobado) " - recibe resumen" else " - no recibe resumen")
		result.toString
	}
*/
}