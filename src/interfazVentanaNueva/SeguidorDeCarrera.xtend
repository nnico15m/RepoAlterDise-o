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
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.commons.utils.ApplicationContext
import dominio.HomeNivel
import dominio.Nivel

class SeguidorDeCarrera extends SimpleWindow<Alumno>  {
	
	
	new(WindowOwner parent) {
		super(parent, new Alumno)
		modelObject.search()
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor De Carrera"
		taskDescription = "Seguidor De Carrera"

		super.createMainTemplate(mainPanel)

		this.createGridActions(mainPanel)
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

		var materiasPanel = new Panel(mainPanel)
		materiasPanel.layout = new HorizontalLayout
		
		var tablaMateriasPanel = new Panel(materiasPanel)
		var labelNumero = new Label(tablaMateriasPanel)
		labelNumero.text = "Materias"
		
		
		var tablaMaterias = new Table<Materia>(tablaMateriasPanel, typeof(Materia))
		tablaMaterias.bindItemsToProperty("materias")
		tablaMaterias.bindValueToProperty("materia")
		this.describeResultsGrid(tablaMaterias)	
		
		var descriptorMateriaPanel = new Panel(materiasPanel, modelObject.materia)
		
		new Label(descriptorMateriaPanel).bindValueToProperty("nombreMateria")
		
		var anioYFinalPanel = new Panel(descriptorMateriaPanel)
		anioYFinalPanel.layout = new HorizontalLayout
		new Label(anioYFinalPanel).setText("Año cursada: ")
		new TextBox(anioYFinalPanel).bindValueToProperty("anioCursada")
		new CheckBox(anioYFinalPanel).bindValueToProperty("finalAprobado")
		new Label(anioYFinalPanel).setText("Final Aprobado")
		
		var profesorPanel = new Panel(descriptorMateriaPanel)
		profesorPanel.layout = new HorizontalLayout
		new Label(profesorPanel).setText("Profesor de cursada: ")
		new TextBox(profesorPanel).bindValueToProperty("profesor")

		//PARA EL SELECTOR DE NIVEL
		var ubicacionPanel = new Panel(descriptorMateriaPanel)
		ubicacionPanel.layout = new HorizontalLayout
		new Label(ubicacionPanel).setText("Ubicación Materia ")
		val selectorNivel = new Selector<Nivel>(ubicacionPanel)
		selectorNivel.allowNull(false)
		selectorNivel.bindValueToProperty("ubicacionMateria")
		selectorNivel.bindItems(new ObservableProperty(homeNivel, "niveles"))
	
	}
	
	def describeResultsGrid(Table<Materia> table) {
		
		new Column<Materia>(table).setTitle("Nombre").bindContentsToProperty("nombreMateria")
		
	}
		
		
	def createGridActions(Panel mainpanel) {
		
		var actionsPanel = new Panel(mainpanel)
		actionsPanel.setLayout(new HorizontalLayout)
		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick [ | this.editarMateria]
		
		var elementSelected = new NotNullObservable("materia")
		
		edit.bindEnabled(elementSelected)
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
	
	def getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel)) as HomeNivel
	}
	
}
	
	
