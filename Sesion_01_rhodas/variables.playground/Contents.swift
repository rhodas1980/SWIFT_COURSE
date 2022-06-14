import UIKit

//**************** Tipos de variable ******************
/*
 Variables mutables (var)
    * Son todas aquellas que pueden cambiar su valor a lo largo de todo su ciclo de vida
 
 Variables inmutables (let)
    * Son todas aquellas que NO pueden cambiar su valor a lo largo de todo su ciclo de vida.
    * Nacen o son creadas con valor asignado y mueren con dicho valor.
 */

// Variables mutables var
var direccion = "vsdgdfg"
direccion = "frasass"

//  Variables inmutables let
let ubicacion = "qwertyuio"
//ubicacion = "kwlcnrekc"  esto da error


// ******************* Tipos de declaracion ***********************
/*
 Declaracion implicita
    * No es necesario especificar el tipo de dato de la variable.
    * Swift infiere a que tipo de dato nos referimos
 
 Declaracion explicita
    * Si es necesario especificar el tipo de dato de la variable.
 */

// declaracion implicito
let igvRate = 0.18 //esto es un double
let edad = 31  //esto es un int

//print(type(of: edad))


// declaracion explicita
var igvRate2: Float = 0.18
let edad2: Int8 = 20

// el double es mas pesado que el float

let sumaIGV = igvRate + Double(igvRate2)
//print(type(of: igvRate))

let sumaIGV2 = Float(igvRate) + igvRate2
//print(type(of: sumaIGV2))

let nombre = "Rhodas"
let apellido = "Agapito"

/* CONCATENACIONES */
let nombreCompleto = nombre + " " + apellido
let nombreCompleto2 = nombre + " " + apellido + " " + String(edad)
let nombreCompleto3 = "\(nombre) \(apellido) \(edad)"
let nombreCompleto4 = "Name: \(nombre) - LastName: \(apellido) - Age: \(edad) "
//aplicacion de escape caracter \n para salto de linea
let nombreCompleto5 = "Name: \(nombre)\nLastName: \(apellido)\nAge: \(edad)"

print(nombreCompleto)
print(nombreCompleto2)
print(nombreCompleto3)
print(nombreCompleto4)
print(nombreCompleto5)



