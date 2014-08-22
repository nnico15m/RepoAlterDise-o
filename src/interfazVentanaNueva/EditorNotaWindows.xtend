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


class EditorNotaWindows extends MainWindow<EditorNota>  {
	
	new() {
		super(new EditorNota)
	}
	
	override createContents(Panel mainPanel) {
		
		new Label(mainPanel).setText("Fecha")
		
		
	}
	
	def static main(String[] args) {
		new EditorNotaWindows().startApplication
	}
	
	
}
