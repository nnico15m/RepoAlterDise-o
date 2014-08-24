package principal


import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import interfazVentanaNueva.SeguidorDeCarrera
import dominio.Materia
import dominio.HomeMateria
import dominio.HomeNivel
import dominio.Nivel

class BuscadorDeMateriasApplicacion extends Application {
	
	static def void main(String[] args) { 
		new BuscadorDeMateriasApplicacion().start()
	}
	
	override protected Window<?> createMainWindow() {
		
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMateria)
		//ESTO VA ???
		//ApplicationContext.instance.configureSingleton(typeof(Nivel), new HomeNivel)
		return new SeguidorDeCarrera(this)
	
	}
	
}