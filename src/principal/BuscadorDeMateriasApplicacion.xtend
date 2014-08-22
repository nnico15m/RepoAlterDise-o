package principal


import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import interfazVentanaNueva.SeguidorDeCarrera
import dominio.Materia
import dominio.HomeMateria

class BuscadorDeMateriasApplicacion extends Application {
	
	static def void main(String[] args) { 
		new BuscadorDeMateriasApplicacion().start()
	}
	
	override protected Window<?> createMainWindow() {
		
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMateria)
		
		return new SeguidorDeCarrera(this)
	
	}
	
}