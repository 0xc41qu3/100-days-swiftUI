//Closures
func sayHi() {
    print("Hi, there 👋🏻")
}

//This is the implicit type of the constant that references the function.
let copyOfSayHi: () -> Void = sayHi
// or
let copyOfSayHi1: () -> () = sayHi
copyOfSayHi()
copyOfSayHi1()

let sayHiAsAClosure = {
    print("Hi, there 👋🏻")
}
sayHiAsAClosure()

//---

func dynamicSayHi(name: String) {
    print("Hi, \(name) 👋🏻")
}

/**
 When we create a copy of a function reference, only the type
 notation is kept, so the parameters names are ignored.
 */
let copyOfDynamicSayHi = dynamicSayHi // It's the same as: String -> Void
copyOfDynamicSayHi("Copy")

/**
 The same happens with closures, so we don't need to specify
 the parameter name when we run the closures:
 */
let dynamicSayHiAsAClosure = {(name: String) -> Void in
    print("Hi, \(name) 👋🏻")
}
//or
let dynamicSayHiAsAClosure1 = {(name: String) in
    print("Hi, \(name) 👋🏻")
}
dynamicSayHiAsAClosure("Foo")
dynamicSayHiAsAClosure1("Baz")

//---

//Real use case:

func twoAlwaysComeFirst(number0: Int, number1: Int) -> Bool {
    number0 == 2 || (number1 == 2 ? false : number0 < number1)
}

let collection = [3,2,98,78]

let sortedCollection = collection.sorted(by: twoAlwaysComeFirst)
//or
let sortedCollection1 = collection.sorted(by: { number0, number1 in
    number0 == 2 || (number1 == 2 ? false : number0 < number1)
})
//or
let sortedCollection2 = collection.sorted { number0, number1 in //It's called Trailing Closures Syntax.
    number0 == 2 || (number1 == 2 ? false : number0 < number1)
}
//or
let sortedCollection3 = collection.sorted { $0 == 2 || ($1 == 2 ? false : $0 < $1) } //It's called Shorthand Syntax.

print(sortedCollection)
print(sortedCollection1)
print(sortedCollection2)
print(sortedCollection3)


//Another example:
let uppercasedCollection = ["a","b","c"].map { $0.uppercased() }
print(uppercasedCollection)