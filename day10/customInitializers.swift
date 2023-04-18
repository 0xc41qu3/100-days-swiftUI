//Custom Initializers
struct Hero {
    let name: String
    var age = 0
    
    //As soon as we define a custom one, the default created by Siwft is no longer available.
    init(name: String) {
        self.name = name
        age = Int.random(in: 0...120)
    }
    
    init(age: Int) {
        self.age = age
        name = "Generic hero"
    }
    
    //P.S. We must always initialize all the structure properties for defining a valid initializer.
}
var batman = Hero(name: "Batman")
print(batman.age)

var genericHero = Hero(age: 30)
print(genericHero.name)