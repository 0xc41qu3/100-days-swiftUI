# Day 07

```swift
import UIKit

// Functions
func isEvenOrOdd(number: Int) {
    print(
        number.isMultiple(of: 2) ?
        "The number \(number) is even" :
        "The number \(number) is odd"
    )
}

isEvenOrOdd(number: 2)

func areStringIdentical(string0: String, string1: String) -> Bool {
    return string0.sorted() == string1.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    /*
     When the function is composed of only one line, and it's of
     the same type as the return specified, we can omit the
     `return` keyword.
     */
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)

func logError() {
    /*
     Even when the function doesn't say explicitly that it returns
     something, we can use the `return` statement to exit the function
     when wanted to.
     */
    return print("Error!")
}
logError()

//Tuples
func getUser0() -> (firstName: String, lastName: String) {
    ("Baz", "Foo")
}
func getUser1() -> (firstName: String, lastName: String) {
    (firstName: "Baz", lastName: "Foo")
}
func getUser2() -> (String, String) {
    ("Baz", "Foo")
}

let (firstName, lastName) = getUser0()
print("Hello, \(firstName) \(lastName)")

let user = getUser1()
print("Hello, \(user.firstName) \(user.lastName)")
print("Hello, \(user.0) \(user.1)")

let (a, b) = getUser2()
print("Hello, \(a) \(b)")

//External parameter name and no argument name.
func printTimesTable(for number: Int) {
    for i in 1...10 {
        print("\(number) x \(i): \(number * i)")
    }
}
func printTimesTable(_ number: Int) {
    for i in 1...10 {
        print("\(number) x \(i): \(number * i)")
    }
}

printTimesTable(for: 8)
printTimesTable(8)

//P.S. Swift supports function overloads based on the argument names.
```
