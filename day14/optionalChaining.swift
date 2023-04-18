//Optional chaining.
let names: [String] = []
let result = names.randomElement()?.uppercased() ?? "Name list is empty."

//P.S. `nil` is returned when the chain returns without accessing the desired value.
