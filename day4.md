# Day 04

```swift
//><-- Type annotations --><

let collectionA: [String] = ["item0", "item1"]
let collectionB: [String] = [String]() // It's an empty collection.
let collectionC: [String] = [] // It's an empty collection.
let collectionD = [String]() // It's an empty collection.

let numberA = 0 // = 0
let numberB: Double = 0 // = 0.0

let isActive:Bool // Constans can be uninitialized.
isActive = true


enum UITheme {
    case dark, light, system
}
var button: UITheme = .system // It's not needed to be explicitly refer to the Enum.
button = .dark
button = .light


//><-- Checkpoint 2 --><
/*
 Create an array of strings, then write some code that prints the
 number of items in the array and also the number of unique items in the array.
 */

let collection = ["Item0", "Item1", "Item2", "Item1"]

print("Number of items in the collection: \(collection.count)")
print("Number of unique items in the collection: \(Set(collection).count)")
```