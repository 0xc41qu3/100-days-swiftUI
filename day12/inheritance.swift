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