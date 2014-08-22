package interfazVentanaNueva

import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import dominio.Alumno


	class SeguidorDeCarrera extends SimpleWindow<Alumno>  {
	
		new(WindowOwner parent) {
			super(parent, new Alumno)
			modelObject.search()
		}
	
		override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor De Carrera"
		taskDescription = "Seguidor De Carrera"

		super.createMainTemplate(mainPanel)

		
	}
	
		override protected addActions(Panel actionsPanel) {
			throw new UnsupportedOperationException("TODO: auto-generated method stub")
		}
	
		override protected createFormPanel(Panel mainPanel) {
			

		}
	
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open}
	
	
}