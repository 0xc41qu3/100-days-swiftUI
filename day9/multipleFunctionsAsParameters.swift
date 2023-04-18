//Multiple functions as parameters:
func runThreeFunctions(first: () -> Void, second: () -> Void, third: () -> Void) {
    first()
    second()
    third()
}

runThreeFunctions {
    print("First function is running...")
} second: {
    print("Second function is running...")
} third: {
    print("Third function is running...")
}