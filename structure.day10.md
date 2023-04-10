# Strcutures in Swift

```swift
//Structs
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

//---

//Computed properties
struct Bus {
    let seatingCapacity = 25
    var numberOfPassengers = 0
    
    var remainingSeats: Int {
        get {
            seatingCapacity - numberOfPassengers
        }
        set {
            /**
             `newValue` is provided automatically by Swift inside the setter block,
             containing the new value for the structure's property.
             */
            numberOfPassengers = seatingCapacity - newValue
        }
    }
    
    /**
     If we don't need to establish a logic for the setting operation,
     we can write without the blocks for each process:
     
     var remainingSeats: Int {
        seatingCapacity - numberOfPassengers
     }
     */
}

var bus33 = Bus()

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 0
print(bus33.remainingSeats) // 25

bus33.numberOfPassengers = 10

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 10
print(bus33.remainingSeats) // 15

bus33.remainingSeats = 5

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 20
print(bus33.remainingSeats) // 5

//---

//Property Observers
struct Game {
    var score = 0 {
        //This code block will always run when the new property value is about to be set.
        willSet {
            print("New score: \(newValue)")
            /**
             We also can access the old value using the property reference: score -- in this case.
             e.g. print("Previous score: \(score)")
             */
        }
        //This code block will always run when the property value has just changed.
        didSet {
            print("Previous score: \(oldValue)")
            print()
        }
    }
    
    // P.S. Makes no sense to attach a property observer to a constant
    // property (`let`) since it will never change.
}

var game = Game()
game.score += 30
game.score += 60

//---

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
```