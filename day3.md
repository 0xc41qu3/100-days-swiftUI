# Day 03

```swift
import UIKit

//><-- Arrays --><
var numbersA = Array<Int>()
numbersA.append(1)
numbersA.append(2)
numbersA.append(3)

let numbersB = [1,2,3]

var numbersC = [Int]()
numbersC.append(1)
numbersC.append(2)
numbersC.append(3)

let numbersD: Array<Int> = Array(repeating: 0, count: 3)

print(numbersA.count, numbersB.count, numbersC.count, numbersD.count)


//><-- Dictionaries --><
var dictionaryA = [String: Int]()
dictionaryA["A"] = 0
dictionaryA["B"] = 1
dictionaryA["C"] = 2

print(dictionaryA["D", default: -1]) // -1 will be printed.

let dictionaryB = [
    "A": 0,
    "B": 1,
    "C": 2,
]

//Dictionaries don't allow duplicated items; they're overwritten.
var dictionaryC = [1:"A", 2: "B"]
dictionaryC[1] = "Z"

print(dictionaryC[1, default: "Unknown"]) // "Z" will be printed.


//><-- Sets --><
var setA = Set<Int>()
setA.insert(0)
setA.insert(1)
setA.insert(2)

let setB = Set([0, 1, 2])

//No duplicates are allowed.

let setC = Set([1, 2, 3, 1, 2, 3])
print(setC.count) // 3

//><-- Enums --><

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum Weekday1 {
    case monday, tuesday, wednesday, thursday, friday
}

var chosenDay = Weekday1.friday
chosenDay = .monday // Since the var's type is fixed, Swift already knows what we're referring to.
```