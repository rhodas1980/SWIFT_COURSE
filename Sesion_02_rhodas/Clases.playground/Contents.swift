import UIKit
//las clases son punteros a estructuras mutables
//las propiedades de la clases pueden ser alteradas
//las instancias de una clase pueden ser allteradas no importan si son let
//las clases usan punteros de memoria siempre
//las clases si permiten herencia y polimorfismos
class Persona {
    var nombre: String
    var apellido: String
    var direccion: String?
    
    var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)"
    }
    
    var iniciales: String {
        let nomnbre = self.nombre.prefix(1).uppercased()
        let apellido = self.apellido.prefix(1).uppercased()
        return nomnbre + apellido
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
    
    func gotToHome() {
        let direccionSegura = self.direccion ?? "Dirección no especificada"
        print("Vamos a casa ubicada en: \(direccionSegura)")
    }
}


var persona1: Persona? = Persona(nombre: "Kenyi", apellido: "Rodriguez")
persona1 = nil
var persona2 = persona1

persona1?.nombre = "Juan"

persona1?.nombre
persona2?.nombre
