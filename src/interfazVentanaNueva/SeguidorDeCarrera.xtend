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

//		this.createResultsGrid(mainPanel)

		
	}
	
/*	def createResultsGrid(Panel mainPanel) {
		var table = new Table(mainPanel, typeof(Materia))
		table.heigth = 200
		table.width = 450
		
		//this.describeResultsGrid(table) Falta poner las materias pero se como se hace
	}
*/	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("Buscar")
			.onClick [ | modelObject.search ] 
			.setAsDefault
			.disableOnError
			
		new Button(actionsPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.crearMateria]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel1 = new Panel(mainPanel)
		searchFormPanel1.setLayout(new ColumnLayout(2))

		var labelNumero = new Label(searchFormPanel1)
		labelNumero.text = "Materias"
		
		new Label(searchFormPanel1)
			.setBackground(Color::ORANGE)
			.bindValueToProperty("materia")
			
		new Label(mainPanel).setText("Materias")
		var tablaMaterias = new Table<Materia>(mainPanel, typeof(Materia))
		tablaMaterias.bindItemsToProperty("materias")
		new Column<Materia>(tablaMaterias)
			.bindContentsToProperty("nombreMateria")
		}
	
	
	def crearMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
	}
	
	def openDialog(NuevaMateriaWindow window) {
		window.onAccept[|modelObject.search]
		window.open
	}
	
}
	
	
