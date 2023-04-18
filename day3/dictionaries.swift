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