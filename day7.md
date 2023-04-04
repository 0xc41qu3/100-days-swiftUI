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
```