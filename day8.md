# Day 08

```swift
//Functions with default parameter values.
func printTimesTables(for number: Int, until: Int = 10) {
    for i in 1...until {
        print("\(number) x \(i): \(number * i)")
    }
}

printTimesTables(for: 5) // prints until 10.
printTimesTables(for: 5, until: 20) // prints until 20.


//Throwing exceptions.
enum PasswordError: Error {
    case short, easy
}

func isValidPassword(_ password: String) throws -> Bool {
    if password.count < 6 {throw PasswordError.short}
    if password == "123456" {throw PasswordError.easy}
    return true
}

do {
    /*
     All function calls that might throw an exception must be flagged
     with a `try` statement.
     */
    try isValidPassword("123")
    print("Continuing the application...")
} catch PasswordError.short {
    print("The password is too short.")
} catch {
    print("There was an error.")
}

/*
 We can force the execution of the function without handling the error,
 but it's hugely not recommended.
 */
try! isValidPassword("1234567")


/*
 Checkpoint 4
 • Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
 • You can't use the built-in sqrt() function or similar - you need to find the square root yourself.
 • If the number is less than 1 or greater than 10,000 you should throw an "out of bounds" error.
 • You should only consider integer square roots.
 • If you can't find the square root, throw a "no root" error.
 */

enum OperationError: Error {
    case outOfBounds, noRoot
}

func sqrt(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 { throw OperationError.outOfBounds }
    if number == 0 { return 0 }
        
    var result: Int = -1
    
    for i in 1...100 {
        if i * i == number {
            result = i
        }
    }
    
    if result == -1 { throw OperationError.noRoot }
    
    return result
}

do {
    print("The square root is: \(try sqrt(1))")
} catch OperationError.noRoot {
    print("The given number has no integer root.")
} catch OperationError.outOfBounds {
    print("The given number is out of the allowed bound.")
} catch {
    print("Something went wrong.")
}
```