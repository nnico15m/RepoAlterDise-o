package dominio

import org.uqbar.commons.utils.Observable

@Observable

class EditorNota implements Cloneable{
	
	@Property int fecha
	@Property String descripcion
	@Property Boolean aprobado //= false
	
	new(int fecha, String descripcion, Boolean aprobado){
		this.fecha = fecha
		this.descripcion = descripcion
		this.aprobado = aprobado
	}
	
	new(){}
	
	def convertir() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override clone() {
		super.clone()
	}
	
	def copiateDe(EditorNota nota) {
		fecha = nota.fecha
		descripcion = nota.descripcion
		aprobado = nota.aprobado
	}
	
/*	override def String toString() {
		
		var result = new StringBuffer
		
		result.append(if (this.aprobado) " - recibe resumen" else " - no recibe resumen")
		result.toString
	}
*/
}