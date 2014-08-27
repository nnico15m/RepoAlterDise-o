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
import dominio.EditorNota

class SeguidorDeCarrera extends SimpleWindow<Alumno>  {
	
	
	new(WindowOwner parent) {
		super(parent, new Alumno)
		modelObject.search()
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor De Carrera"
		taskDescription = "Seguidor De Carrera"

		super.createMainTemplate(mainPanel)

//		this.createMateriasActions(mainPanel)
	}

	override protected addActions(Panel actionsPanel) {
			
		new Button(actionsPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.crearMateria]
				
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
		tablaMaterias.setHeigth(200)
		

		this.describeMateriasGrid(tablaMaterias)	
		
		this.crearDescriptorMateriaPanel(materiasPanel)

	}

	def crearDescriptorMateriaPanel(Panel materiasPanel){
		
		var descriptorMateriaPanel = new Panel(materiasPanel)//, modelObject.materia)
		
		new Label(descriptorMateriaPanel).setHeigth(20).bindValueToProperty("materia.nombreMateria")
				
		var anioYFinalPanel = new Panel(descriptorMateriaPanel)
		anioYFinalPanel.layout = new HorizontalLayout
		new Label(anioYFinalPanel).setText("Año cursada: ")
		new TextBox(anioYFinalPanel).bindValueToProperty("materia.anioCursada") //PROBANDO
		new CheckBox(anioYFinalPanel).bindValueToProperty("materia.finalAprobado") //
		new Label(anioYFinalPanel).setText("Final Aprobado")
		
		var profesorPanel = new Panel(descriptorMateriaPanel)
		profesorPanel.layout = new HorizontalLayout
		new Label(profesorPanel).setText("Profesor de cursada: ")
		new TextBox(profesorPanel).bindValueToProperty("materia.profesor")
 
		//PARA EL SELECTOR DE NIVEL
		var ubicacionPanel = new Panel(descriptorMateriaPanel)
		ubicacionPanel.layout = new HorizontalLayout
		new Label(ubicacionPanel).setText("Ubicación Materia ")
		val selectorNivel = new Selector<Nivel>(ubicacionPanel)
		selectorNivel.allowNull(false)
		selectorNivel.bindValueToProperty("materia.ubicacionMateria")
		selectorNivel.bindItems(new ObservableProperty(homeNivel, "niveles"))
		
		new Label(descriptorMateriaPanel).setText("Notas de cursada").setHeigth(20)
		
		var tablaNotas = new Table<EditorNota>(descriptorMateriaPanel, typeof(EditorNota))
		tablaNotas.setHeigth(60)
		tablaNotas.bindItemsToProperty("materia.notas")
		tablaNotas.bindValueToProperty("materia.nota")
		this.describeNotasGrid(tablaNotas, descriptorMateriaPanel)
		
		this.createNotasActions(descriptorMateriaPanel)
		
	} 
	
	
	
	def describeNotasGrid(Table<EditorNota> table,Panel actionPanel) {
		
		new Column<EditorNota>(table)
			.setTitle("Fecha")
			.bindContentsToProperty("fecha")
			
		new Column<EditorNota>(table)
			.setTitle("Descripcion")
			.bindContentsToProperty("descripcion")
			
		new Column<EditorNota>(table)
			.setTitle("Aprobado")
			.bindContentsToTransformer([nota|if (nota.aprobado) "Si" else "No"])
	
	//	var elementSelected = new NotNullObservable("materia")
		
	//	edit.bindEnabled(elementSelected)
	
	
	}
	
	def describeMateriasGrid(Table<Materia> table) {
		
		//new Column<Materia>(table).setTitle("Nombre").bindContentsToProperty("nombreMateria")
		//table.bindValueToProperty("materia")
		new Column<Materia>(table).setTitle("Nombre").bindContentsToProperty("nombreMateria")
		table.bindValueToProperty("materia")

	}
		
		
	def createNotasActions(Panel mainpanel) {
		
		var actionsPanel = new Panel(mainpanel)
		actionsPanel.setLayout(new ColumnLayout(3))
		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick [ | this.editarNota]
			.setWidth(70)

//		var elementSelected = new NotNullObservable("notas")		
//		edit.bindEnabled(elementSelected)
		
		new Button(actionsPanel)
			.setCaption("+")
			.onClick[| this.crearNota]
			.setWidth(70)
			
		new Button(actionsPanel)
			.setCaption("-")
			.onClick[| this.BorrarNota]
			.setWidth(70)

	}
	
	def BorrarNota() {
		modelObject.borraTuNota()
	}
	
	def crearNota() {
		this.openCreadorNota(new NuevaNotaWindow(this, modelObject.materia))
	}
	
	def openCreadorNota(NuevaNotaWindow window){
		window.onAccept[|modelObject.search]
		window.open
	}
		
	def crearMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
		
	}
	
	def openDialog(NuevaMateriaWindow window) {
		window.onAccept[|modelObject.search]
		window.open
	}
	
	def editarNota() {
		this.openDialog(new EditorNotaWindows(this, modelObject.materia.nota))
	}
	
	def openDialog(EditorNotaWindows window) {
		window.onAccept[|modelObject.search]
		window.open
	}
	
	def getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel)) as HomeNivel
	}
	
	
		
	
	
	
	
}
	
	
