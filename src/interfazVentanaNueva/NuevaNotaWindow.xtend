package interfazVentanaNueva

import org.uqbar.arena.windows.WindowOwner
import dominio.EditorNota
import dominio.Materia

class NuevaNotaWindow extends EditorNotaWindows{
	
	@Property Materia materia
	
	new(WindowOwner parent, Materia unaMateria) {
		super(parent, new EditorNota())
		materia = unaMateria
	}
	
	override executeTask(){
		materia.agregaNota(modelObject)
		super.executeTask()
	}
	
}