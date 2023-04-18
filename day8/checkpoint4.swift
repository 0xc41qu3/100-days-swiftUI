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
        
    var result = -1
    
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