import UIKit

//una tupla con dos objetos en posiciones 0 y 1
let informacion1 = ("Rhodas","Agapito")
informacion1.0
informacion1.1

//una tupla con dos nombres de alias : nombre , apellido
let informacion2 = (nombre: "Rhodas", apellido: "Agapito")
informacion2.nombre    //lo llamo por su alias
informacion2.apellido
informacion2.1          //lo llamo por su indice de objeto
informacion2.0

//en esta tupla se declara explicito el alias y el tipo de dato
let informacion3: (nombre: String,  apellido: String, edad: Int) = ("Kenyi","Rodriguez",32)
informacion3.nombre
informacion3.apellido

//proporcionamos un nuevo alias Persona para usarlo en la tupla informacion4
typealias Persona = (nombre: String,
                     apellido: String,
                     edad: Int)

let informacion4: Persona = ("Rhodas", "Agapito", 42)
informacion4.nombre
informacion4.apellido

//creamos un nuevo alias Operaciones para usarlo en la funcion operar
typealias Operaciones = (suma: Double, resta: Double, producto: Double, division: Double)

func operar(n1: Double , n2: Double) -> Operaciones {
    let suma = n1 + n2
    let resta = n1 - n2
    let producto = n1 * n2
    let div = n1 / n2
    
    return (suma,resta,producto,div)
    
}
// atravez de la constante resultado accedemos a la salida de la funcion operar
let resultado = operar(n1: 6, n2: 4)
resultado.suma
resultado.resta
resultado.producto
resultado.division

//FIN












