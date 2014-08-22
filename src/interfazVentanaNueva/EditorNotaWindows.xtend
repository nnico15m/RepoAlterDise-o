package interfazVentanaNueva

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel
import dominio.EditorNota
import org.uqbar.arena.layout.ColumnLayout

class EditorNotaWindows extends MainWindow<EditorNota>  {
	
	new() {
		super(new EditorNota)
	}
	
	override createContents(Panel mainPanel) {
		
		title = "Editor de Texto"
		
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))

		var labelFecha = new Label(searchFormPanel)
		labelFecha.text = "Fecha"
		labelFecha.foreground = Color::BLUE
		

		var textBoxFecha = new TextBox(searchFormPanel)
		textBoxFecha.bindValueToProperty("fecha")
		textBoxFecha.width = 50
		
	}
	
	def static main(String[] args) {
		new EditorNotaWindows().startApplication
	}
	
	
}
