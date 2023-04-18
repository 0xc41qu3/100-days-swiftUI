//External parameter name and no argument name.
func printTimesTable(for number: Int) {
    for i in 1...10 {
        print("\(number) x \(i): \(number * i)")
    }
}
func printTimesTable(_ number: Int) {
    for i in 1...10 {
        print("\(number) x \(i): \(number * i)")
    }
}

printTimesTable(for: 8)
printTimesTable(8)

//P.S. Swift supports function overloads based on the argument names.