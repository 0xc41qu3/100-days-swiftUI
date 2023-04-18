//Functions with default parameter values.
func printTimesTables(for number: Int, until: Int = 10) {
    for i in 1...until {
        print("\(number) x \(i): \(number * i)")
    }
}

printTimesTables(for: 5) // prints until 10.
printTimesTables(for: 5, until: 20) // prints until 20.