# Classes and inheritance in Swift

```swift
/**
 Classes
  
 Five main differences compared to structures:
 1. You can make one class build upon functionality in another class (inheritance).
 2. Swift won't generate a memberwise initializer for classes.
 3. If we copy an instance of a class, both copies share the same data -- it works as only a reference.
 4. We can add a deinitializer to run when the final reference (an instance) to a data is destroyed.
 5. Constant class instances can have their variable properties changed.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

let game = Game()
game.score += 10 //It would fail if we had a struct because the instance is stored in a constant (fifth difference).

//---

/**
 Inheritance
 
 1. We can use the `final` keyword to prevent a class from being inherited. E.g., `final class Game`.
 2. If a class overrides a parent's method but modifies its return value or parameters, we don't need to use the `override` statement because it's a new method.
 */

class Employee {
    let workingHours: Int
    
    init(workingHours: Int) {
        self.workingHours = workingHours
    }
    
    func printSummary() {
        print("I work \(workingHours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(workingHours) hours.")
    }
    
    override func printSummary() {
        print("I try to work \(workingHours) hours a day -- please, remove the meetings!")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(workingHours) hours.")
    }
    
     func printSummary(meeting: String) {
        print("I work \(workingHours) hours a day, but I gotta attend a last meeting: \(meeting)")
    }
}

let dan = Developer(workingHours: 8)
let jane = Manager(workingHours: 10)

dan.work()
jane.work()

dan.printSummary()
jane.printSummary(meeting: "Jane<>Dan")

//---

//Class initializers
class Vehicle {
    var isEletric: Bool
    
    init(isEletric: Bool) {
        self.isEletric = isEletric
    }
}

class Car: Vehicle {
    let isConvertable: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertable = isConvertible
        super.init(isEletric: isElectric)
    }
}
let tesla = Car(isElectric: true, isConvertible: false)

//When our subclass doesn't need an initializer, it automatically inherits its parent's initializer.
class Motorcycle: Vehicle {}
let harley = Motorcycle(isEletric: false)

//---

//How to copy class instances:
class User {
    var username = "Anonymous"
    
    //For fixing the reference copy problem:
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user = User()
var copiedUser = user

print(user.username) //Anonymous.
print(copiedUser.username) //Anonymous.

copiedUser.username = "ell13"

print(user.username) //ell13.
print(copiedUser.username) //ell13.

//P.S. If we had used a struct instead, the reference won't exist, so that wouldn't happen.

//Applying the solution for the reference problem:
var newUser = User()
var deepCopiedUser = newUser.copy()

print(newUser.username) //Anonymous.
print(deepCopiedUser.username) //Anonymous.

deepCopiedUser.username = "ell13"

print(newUser.username) //Anonymous.
print(deepCopiedUser.username) //ell13.

//---

/**
 Deinitializer
 
 1. We don't use func with deinitializers.
 2. Deinitializers can never take parameters or return data.
 3. Deinitializers run when the last reference to a class instance is destroyed.
 4. We never call deinitializers directly.
 5. Structs don't have deinitializers.
 */
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is alive!")
    }
    
    deinit {
        print("\(name) is dead!\n")
    }
}

//Right before the next iteration begins, the instance is wiped. Thus the deinitializer is called.
for i in 1...3 {
    let person = Person(name: "Person \(i)")
    print("Person \(i) is living their life...")
}

//Person 1 is alive!
//Person 1 is living their life...
//Person 1 is dead!

//Person 2 is alive!
//Person 2 is living their life...
//Person 2 is dead!

//Example 2
var people = [Person]()

for i in 1...3 {
    let person = Person(name: "Person \(i)")
    people.append(person)
    
    print("Person \(i) is living their life...\n")
}

print("Loop has finished.")
people.removeAll()
print("Collection is now empty.")

//Person 1 is alive!
//Person 1 is living their life...

//Person 2 is alive!
//Person 2 is living their life...

//Person 3 is alive!
//Person 3 is living their life...

//Loop has finished.
//Person 1 is dead!

//Person 2 is dead!

//Person 3 is dead!

//Collection is now empty.

//---

/**
 Checkpoint 7
 • Make a class hierarchy for animals.
 • Start with Animal. Add a legs property for the number of legs an animal has.
 • Make Dog a subclass of Animal, giving it a speak method that prints a dog barking string, but each subclass should print something different.
 • Make Corgi and Poodle subclasses of Dog.
 • Make Cat an Animal subclass. Add a speak method, with each subclass printing something different, and an `isTame` Boolean, set with an initializer.
 • Make Persian and Lion as subclasses of Cat.
 */

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        print("The animal is speaking...")
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    override func speak() {
        print("The dog is barking...")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    override func speak() {
        print("The cat is meowing...")
    }
}

class Corgi: Dog {
    override func speak() {
        print("The corgi is barking... 🐶")
    }
}

class Poodle: Dog {
    override func speak() {
        print("The poodle is barking...")
    }
}

class Persian: Cat {
    override func speak() {
        print("The persian is meowing...")
    }
}

class Lion: Cat {
    override func speak() {
        print("The lion is roaring...")
    }
}

Animal(legs: 4).speak() //The animal is speaking...
Dog().speak() //The dog is barking...
Corgi().speak() //The corgi is barking... 🐶
Poodle().speak() //The poodle is barking...
Cat(isTame: true).speak() //The cat is meowing...
Persian(isTame: true).speak() //The persian is meowing...
Lion(isTame: false).speak() //The lion is roaring...
```