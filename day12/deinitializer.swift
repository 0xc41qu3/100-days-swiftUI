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