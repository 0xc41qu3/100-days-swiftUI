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