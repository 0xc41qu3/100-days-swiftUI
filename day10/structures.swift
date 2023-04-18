//Structures
struct Person {
    let name: String
    var age = 0
    
    /**
     Since an instance of this struct can be stored in a constant, we must signal that a method
     changes the structure. Doing that, we add a constraint, not allowing the instance to be stored
     in a constant (`let`), only inside a variable (`var`) **if we try to change the struct's data**.
     */
    mutating func getOlder() {
        age += 1
    }
    
    func showId() {
        print("Name: \(name)")
        print("Age: \(age)")
    }
}

//let mike = Person(name: "Mike Tyfflor", age: 18)
//mike.getOlder() //Not allowed because it must be kept in a variable (`var`).

var mike = Person(name: "Mike Tyfflor", age: 18)
mike.getOlder() // Allowed since it's stored in a variable (`var`).

//---

/**
 That's a syntax sugar for creating an instance of a structure.
 If we don't use it, we will always need to use the `init` method.
 */
let nancy = Person(name: "Nancy Wheeler")
//or
let nancy0 = Person.init(name: "Nancy Wheeler")

//---

struct Animal {
    /**
     If we set a default value for a property of a structure and that property is a constant (`let`),
     its value will never change, even when we pass a value on initializing the instance; what's prohibited.
     */
    let name = "General"
}
//let bat = Animal(name: "bat") //Not allowed.

struct Animal0 {
    var name = "General"
}
let bat = Animal0(name: "bat") //Allowed.