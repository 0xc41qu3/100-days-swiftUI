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