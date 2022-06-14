import UIKit
//Los Structs , enum y los class son modelos de datos

//los structs estan basados en una asignacion por referencia
// este es un struct con sus propiedades
//la instancia de un struct no puede ser alterados asi sea var o let
//si las propiedades del struct se mantienen en let
//Los structs no usan punteros , depositan el dato en un cluster y lo usan
//directo.
//el struct no permite herencia ni polimorfismo

struct Gato {
    let nombre: String
    let edad: String
    var raza: String?
}
//Llamamos al strutc pero no lo hemos inicializado
// por defecto la estructura Gato construira el constructor con las
//propiedades no inicializadas aguas abajo

Gato(nombre: "Toribio", edad: "15", raza: "siames")
Gato(nombre: "Toribio", edad: "15", raza: nil)
Gato(nombre: "Toribio", edad: "15")

/*fin*/

struct Persona {
    let nombre: String  //obligatorio inicializar
    let apellido: String    //obligatorio inicializar
    var direccion: String?  //no es obligatorio
    
    //variable computada no almacena nada , solo ejecuta la operacion
    var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)" //operacion
    }
    
    //variable computada , no almacena nada
    var iniciales: String {
        //operacion que convierte la primera letra del nombre en mayuscula
        let nomnbre = self.nombre.prefix(1).uppercased()
        //operacion que convierte la primera letra del apellido en mayuscula
        let apellido = self.apellido.prefix(1).uppercased()
        //concatena
        return nomnbre + " " + apellido
    }
    
    //constructor personalizado del struct Persona
    init(nombre: String, apellido: String) {
        //con el self hago referencia a la instancia en
        //que me encuentro
        self.nombre = nombre
        self.apellido = apellido
    }
    
    //funcion
    func gotToHome() {
        let direccionSegura = self.direccion ?? "Dirección no especificada"
        print("Vamos a casa ubicada en: \(direccionSegura)")
    }
}
//llamamos al struct con los parametros inicializados en el constructor
Persona(nombre: "Rhoads", apellido: "Stone")



//otro ejemplo
var persona = Persona(nombre: "kenyi", apellido: "Fujimoru")
persona.direccion = "esta es mi direccion" // puedo modificar ya que es var en el struct
//persona.nombre = "italo" //no se puede modificar ya que es un let en struct



//llamamos a la variable computada nombreCompleto
persona.nombreCompleto

//variable computada iniciales
persona.iniciales

//ahora la direccion no apunta a nada
persona.direccion=nil
persona.direccion

//llamamos a la funcion
persona.gotToHome()   //vamos a casa en direccion no especificada


//si asignamos un valor
persona.direccion = "Calle los olvidados del señor 666"
persona.gotToHome() // saldra la direccion



//string, double, int son structs

//FIN


struct Motor {
    
    let cilindrada: String
    let potencia: String
    
    func encender() {
        print("Motor encendido")
    }
    
    func apagar() {
        print("Motor apagado")
    }
}

struct Automovil {
    
    let motor: Motor
    
    func andar() {
        self.motor.encender()
        self.motor.apagar()
    }
}

let motor = Motor(cilindrada: "2.0T", potencia: "280HP")
let auto = Automovil(motor: motor)

auto.motor.cilindrada
auto.motor.potencia
auto.motor.apagar()
auto.motor.encender()
auto.andar()
