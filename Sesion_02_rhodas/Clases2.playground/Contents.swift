import UIKit
/*herencias en clases*/

class Persona {
    let nombre: String
    let apellido: String
    
    var iniciales: String {
        let nomnbre = self.nombre.prefix(1).uppercased()
        let apellido = self.apellido.prefix(1).uppercased()
        return nomnbre + apellido
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}
//La clase alumno hereda de persona
class Alumno: Persona {
    
    let codAlumno: String
    //override del alias iniciales sobre la clase padre, polimorfismo
    override var iniciales: String {
        let nombre = self.nombre.prefix(2).uppercased()
        let apellido = self.apellido.prefix(2).uppercased()
        return "\(nombre) \(apellido)"
    }
    //constructor de alumno
    init(nombre: String, apellido: String, codAlumno: String) {
        self.codAlumno = codAlumno
        //super para llamar al constructor de la clase padre Persona
        super.init(nombre: nombre, apellido: apellido)
    }
}
//la clase profesor hereda de persona
class Profesor: Persona {
    let codEmpleado: String
    
    init(nombre: String, apellido: String, codEmpleado: String) {
        self.codEmpleado = codEmpleado
        super.init(nombre: nombre, apellido: apellido)
    }
}

let alumno = Alumno(nombre: "Kenyi", apellido: "Rodriguez", codAlumno: "87654321")
alumno.iniciales

let profesor = Profesor(nombre: "Kenyi", apellido: "Rodriguez", codEmpleado: "123456789")
profesor.iniciales
