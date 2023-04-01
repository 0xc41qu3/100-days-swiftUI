# Day 05

```swift
//><-- If statements --><

let nameA = "Anna"
let nameB = "Patrick"

if nameA < nameB {
    print("\(nameA) comes before \(nameB) alphabetically")
}
if nameA > nameB {
    print("\(nameB) comes before \(nameA) alphabetically")
}

if nameA.isEmpty {
    print("Empty name is not allowed.")
}

enum Size: Comparable {
    case small, medium, large
}

let medium: Size = .medium
let small: Size = .small

// The comparison is based on the declaration order in the enum.
if small < medium {
    print("\(small) is less than \(medium)")
}

// ><-- Multiple conditions --><
enum AvailableOptions {
  case A, B, C, D
}

let chosenOption = AvailableOptions.B

if chosenOption == .A || chosenOption == .B {
  print("A or B was chosen.")
} else if chosenOption == .C {
  print("C option was chosen.")
} else {
  print("D option or any other else was chosen.")
}

switch chosenOption {
  case .A:
    print("A was chosen.")
  case .B:
    print("B was chosen.")
  case .C:
    print("C was chosen.")
    fallthrough // It runs this block of code and the following one.
  case .D:
    print("D was chosen.")
}

//><-- Ternary operator --><
let condition = false
let expressionResult = condition ? "When it's true" : "When it's false"
```
