package interfazVentanaNueva

import dominio.EditorNota
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.TextBox
import dominio.Materia
import dominio.HomeMateria
import org.uqbar.commons.utils.ApplicationContext

class NuevaMateriaWindow extends Dialog<Materia>{
	
	new(WindowOwner parent) {
		super(parent, new Materia)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel)
			.setCaption("Aceptar")
			.onClick[|this.accept]
			
/*		En el modelo no tenemos bot�n volver
		new Button(actionsPanel)
			.setCaption("Volver")
			.onClick[|this.close]	
*/
	}
	
	
	
	override executeTask(){
		homeMateria.create(modelObject)
		super.executeTask()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.setTitle("Nueva Materia")
		taskDescription = "Ingrese la materia"
		mainPanel.layout = new VerticalLayout
		new Label(mainPanel).setText("Nombre:")
		new TextBox(mainPanel).bindValueToProperty("nombreMateria")
		
	}
	
	def HomeMateria getHomeMateria() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}