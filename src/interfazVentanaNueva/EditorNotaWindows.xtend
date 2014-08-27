package interfazVentanaNueva

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox
import dominio.EditorNota
import org.uqbar.arena.windows.WindowOwner
import dominio.Materia
import dominio.HomeMateria
import org.uqbar.commons.utils.ApplicationContext
import dominio.Alumno
import org.uqbar.arena.widgets.tables.Table

class EditorNotaWindows extends Dialog<EditorNota>  {
	
	
	new(WindowOwner parent) {
		super(parent, new EditorNota())
	}

	override createContents(Panel mainPanel) {
		
		title = "Editor de Texto"

		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))

		var labelFecha = new Label(searchFormPanel)
		labelFecha.text = "Fecha"
		
		var textBoxFecha = new TextBox(searchFormPanel)
		textBoxFecha.bindValueToProperty("fecha")
		textBoxFecha.width = 150
		
		var searchFormPanel2 = new Panel(mainPanel)
		searchFormPanel2.setLayout(new ColumnLayout(2))
		
		var labelDescripcion = new Label(searchFormPanel2)
		labelDescripcion.text = "Descripcion"
		
		var textBoxDescripcion = new TextBox(searchFormPanel2)
		textBoxDescripcion.bindValueToProperty("descripcion")
		textBoxDescripcion.width = 150
		
		var searchFormPanel4 = new Panel(mainPanel)
		
		searchFormPanel4.setLayout(new HorizontalLayout)
		
		var checkResumen = new CheckBox(searchFormPanel4)
		checkResumen.bindValueToProperty("aprobado")
		
		var labelAprobado = new Label(searchFormPanel4)
		labelAprobado.text = "Aprobado"
		
		var searchFormPanel3 = new Panel(mainPanel)
		searchFormPanel3.setLayout(new ColumnLayout(2))
	
/*		new Button(searchFormPanel3)
			.setCaption("Volver")
			.onClick[|this.close]	
*/	
	
		new Button(searchFormPanel3) => [
			caption = "Aceptar"
			onClick [ | this.accept]//this.modelObject.convertir ]
		]
	}
	
	def abrirVentana() {
		this.openWindow(new NuevaMateriaWindow(this))
	}
	
	def openWindow(Dialog<?> ventana) {
		ventana.open
	}
	// tirar un error aca?
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def getHomeMateria() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMateria
	}
	
	
}
