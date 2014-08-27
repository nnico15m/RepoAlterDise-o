package interfazVentanaNueva

import org.uqbar.arena.windows.Dialog
import dominio.Materia
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import dominio.Alumno
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Selector
import dominio.Nivel
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.widgets.tables.Table
import dominio.EditorNota
import org.uqbar.commons.utils.ApplicationContext
import dominio.HomeNivel
import org.uqbar.arena.widgets.tables.Column

class Probar extends Dialog<Alumno>{
	
	new(WindowOwner owner, Alumno model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel materiasPanel) {
		
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
		
		new Label(descriptorMateriaPanel).setText("Notas de cursada")
		var tablaNotas = new Table<EditorNota>(descriptorMateriaPanel, typeof(EditorNota))
		tablaNotas.bindItemsToProperty("notas")
//		tablaNotas.bindValueToProperty("nota")
		this.describeNotasGrid(tablaNotas)
		
	}
	
	def describeNotasGrid(Table<EditorNota> table) {
		new Column<EditorNota>(table)
			.setTitle("Fecha")
			.bindContentsToProperty("fecha")
			
		new Column<EditorNota>(table)
			.setTitle("Descripcion")
			.bindContentsToProperty("descripcion")
			
		new Column<EditorNota>(table)
			.setTitle("Aprobado")
			.bindContentsToTransformer([nota|if (nota.aprobado) "Si" else "No"])
	}
	
	def getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel)) as HomeNivel
	}
	
}