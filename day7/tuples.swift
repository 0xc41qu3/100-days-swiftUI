//Tuples
func getUser0() -> (firstName: String, lastName: String) {
    ("Baz", "Foo")
}
func getUser1() -> (firstName: String, lastName: String) {
    (firstName: "Baz", lastName: "Foo")
}
func getUser2() -> (String, String) {
    ("Baz", "Foo")
}

let (firstName, lastName) = getUser0()
print("Hello, \(firstName) \(lastName)")

let user = getUser1()
print("Hello, \(user.firstName) \(user.lastName)")
print("Hello, \(user.0) \(user.1)")

let (a, b) = getUser2()
print("Hello, \(a) \(b)")