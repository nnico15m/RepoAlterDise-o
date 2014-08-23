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
import dominio.HomeMateria
import dominio.Materia



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
			
		new Button(actionsPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.crearMateria]
			
		new Button(actionsPanel)	
			.setCaption("Editar")
			.onClick[|this.editarMateria]
		
			
			
				
			
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel1 = new Panel(mainPanel)
		searchFormPanel1.setLayout(new ColumnLayout(2))

		var labelNumero = new Label(searchFormPanel1)
		labelNumero.text = "Materias"
		
	
		var tablaMaterias = new Table<Materia>(mainPanel, typeof(Materia))
		tablaMaterias.bindItemsToProperty("materias")
		this.describeResultsGrid(tablaMaterias)	
		
		}
	
	def describeResultsGrid(Table<Materia> table) {
		
		new Column<Materia>(table).setTitle("Nombre").bindContentsToProperty("nombreMateria")
		//new Column<Materia>(table).bindContentsToProperty("Editar")
		
		
	}
		
	def crearMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
		
	}
	
	def openDialog(NuevaMateriaWindow window) {
		window.onAccept[|modelObject.search]
		window.open
	}
	
	def editarMateria() {
		
		this.openDialog(new EditorNotaWindows(this))
	}
	
	def openDialog(EditorNotaWindows window) {
		window.onAccept[|modelObject.search]
		window.open
	}
	
	
}
	
	
