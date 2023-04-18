/**
 Protocol extension
 
 It allows us to extend protocols, adding methods and properties to them.
 Roughly like the technique that Apple calls _protocol-oriented programming_.
 */

/**
 Since array, dictionaries, and sets conform to the Collection protocol, if we extend them,
 all of them will have access to the properties and methods we define, as follow:
 */
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let names = ["John", "Mary"]

if names.isNotEmpty {
    print(names.count) // 2
}

//Following the approach above, we can implement some default methods, for example:
protocol Person {
    var name: String { get }
    func breathe()
}

extension Person {
    func breathe() {
        print("\(name) is breathing...")
    }
}

struct Employee: Person {
    let name: String
    /**
     The `breathe` method is not required because its requirement was satisfied
     by the type extension, which implemented what is now the default implementation.
     
     func breathe() {..} It's not longer required to implement it.
     */
    
}

let johnny = Employee(name: "Johnny")
johnny.breathe()
