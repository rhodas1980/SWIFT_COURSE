import UIKit

//******************* Variables Seguras ******************
/*
 * Una variable segura es aquella que no admite nulo en su valor
 * Es de cualquier tipo de dato
 */

//******************* Variables opcionales ******************
/*
 * SON VARIABLES QUE ADMITEN UN ERROR
        - Para Swift un nulo es un error
 
 * Una variable insegura es aquella que admite nulos en su valor
 * Es de cualquier tipo de dato
 * Tiene que tener una declaracion EXPLICITA!!
 * Para acceder al dato guardado, debe realizar un desempaquetado(unwrap) con el operador (??)
 * Cuando usamos la variable, no estamos usando el dato, estamos usando el puntero al dato.
 
 */

//una variable segura con declaracion explicita
let n1: Int = 10

//una variable opcional que almacena un puntero (luego el puntero podria señalar a
//un dato o un nill)
let n2: Int? = 15

print(n1) //imprime el dato 10
//print(n2) //imprime el puntero de memoria

//desempaquetamos el valor que señala el puntero n2,
//si el puntero señala a 15 , entonces n2Seguro tendra a 15
//si el puntero señala a nill , entonces n2Seguro tendra a 0 en este caso
//n2Seguro valdra 0 si el desempaquetado falla, 0 es el valor por defecto en este caso
let n2Seguro = n2 ?? 0

let suma = n1 + (n2 ?? 0)

print(n1)
print(n2Seguro)
//print(n2)
print(suma)


//constante  n3 opcional que apunta a un nill
let n3: Int? = nil

//si desempaquetamos y falla por apuntar a un nill,  agregamos el cero por defecto
let otraSuma = n1 + (n3 ?? 0)
print(otraSuma)  //  10


// usamos opcionales para ingresar datos a una funcion
func registrarConNombre(_ nombre: String?, apellido: String?) {
    let nombre = nombre ?? "No ingreso el nombre"
    let apellido = apellido ?? "No ingreso el apellido"
    
    //construccion de un string multilinea
    let mensaje = """
    "El usuario registrado fue: "
    Nombre: \(nombre)
    Apellido: \(apellido)
    """
    
    print(mensaje)
    
}

registrarConNombre("Rhodas", apellido: nil)
registrarConNombre("Rhodas", apellido: "Agapito")
registrarConNombre(nil, apellido: "Blbka")



/***
 * What does the Operator _ , ! , ? , ?? , Means on Swift
 * _ : The under score operator is usually used in swift function definition . It is used to replace the function parameter's
 *  external label. So when you call the swift function, you do not need to use function parameter´s external label
 *  to specify which parameter this value is assigned to, just pass the parameter in function parameters definition order.
 *
 * ?:  The question mark operator is used to define a swift variable as optional variable, which means this variable do not
 * need to be initialized when define it. If you do not initialize it with a default value, then it's default value is nill  which
 * is similar with null in java. If the optional variable has child optional variable,then you can use optional chaining to refer
 *  it such as a?.b?.c?.text
 *
 * !: If you want to get an optional variable's original value, you should add ! mark at the variable name's end to force
 * unwrap it, then you can use it's original value.
 *
 * ??: This operator is called nil coalescing operator. It is used to return first none nil value of the two swift variables.
 * For example, for swift code     let z = x ?? y      ,  if x  value is not nil then assign x value to z , otherwise it will
 * assign y  value to z.   So     let z = x ?? y    can be treated as      let  z  = x != nil ? x! : y
 **/

// if  set  x to nil ,  then  the variable z value is 1
let x:Int? = nil

//let x:Int? = 2
let y:Int? = 1
let z = x ?? y
print(z!)




