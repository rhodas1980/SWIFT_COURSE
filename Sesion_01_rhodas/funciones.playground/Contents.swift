import UIKit
import Foundation

//******************** FUNCIONES ****************
/*
 =======
 PARTES:
 =======
 
 * Se inicia con la palabra reserva "func"
 * el nombre del metodo o de la funcion
 * Los argumentos o parametros de la funcion, los cuales son opcionales y van entre ()
 * El tipo de dato que retorna la funcion: ( -> TipoDato)
        - Esto es opcional si es del tipo Void.
 
 ===============================
 ARGUMENTOS DE ENVIO OBLIGATORIO
 ===============================
 Los argumentos constan de 3 partes principales:
 
 * Alias o descripcion de la variable (_, descripcion, nada)
        * El _ indica que la variable no tiene alias
        * Descripcion indica que la variable tiene un alias
        * Nada indica que la variable se autodescribe y es su mismo alias
 
 * El nombre de la variable
 * El tipo de dato de la variable antepuesto por el simbolo ":"
 
 Ejemplo funcion:
 func nombreMetodo(Argumentos) -> Void { // Code here }
 func nombreMetodo(Argumentos) { //Code here }
 func nombreMetodo(Argumentos) -> Int { //Code here }
 
 Ejemplo Argumentos:
 (_ variable: TipoDato)
 (alias variable: TipoDato) *
 (variable: TipoDato) *

 //la funcion de abajo genera confusiones para su lectura  por lo que se recomienda usar
 // el orden señalado aguas arriba
 pow(2,3) = 8? ó 9?
 
 */


//OFICIAL
func sumarNumero1(_ n1: Int, conNumero2 n2: Int) -> Int {n1 + n2}
sumarNumero1(5, conNumero2: 10)

sumarNumero1(45, conNumero2: 45)


//RECOMENDADO
func sumar(numero1 n1: Int, conNumero2 n2: Int) -> Int {n1 + n2}
sumar(numero1: 4, conNumero2: 7)
sumar(numero1: 8, conNumero2: 8)


func sumar(numero1: Int, numero2: Int) -> Int {numero1 + numero2}
sumar(numero1: 5, numero2: 8)

//ESTO NO VA .... ESTO ES OBSOLETO, ESTO SE USA EN LOS 90' ES VIEJO!!!
func sumar(_ n1: Int, _ n2: Int) -> Int {n1 + n2}
sumar(4,10)

//LO QUE YO USO
func registrarUsuarioConNombre(_ nombre: String, conApellido apellido: String) {}
registrarUsuarioConNombre("Kenyi", conApellido: "Rodriguez")

func registrarUsuarioConNombre(_ nombre: String, apellido: String) {}
registrarUsuarioConNombre("Kenyi", apellido: "Ramonez")


// FIN DE FUNCIONES
















