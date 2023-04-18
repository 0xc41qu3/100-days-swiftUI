//Throwing exceptions.
enum PasswordError: Error {
    case short, easy
}

func isValidPassword(_ password: String) throws -> Bool {
    if password.count < 6 {throw PasswordError.short}
    if password == "123456" {throw PasswordError.easy}
    return true
}

do {
    /*
     All function calls that might throw an exception must be flagged
     with a `try` statement.
     */
    try isValidPassword("123")
    print("Continuing the application...")
} catch PasswordError.short {
    print("The password is too short.")
} catch {
    print("There was an error.")
}

/*
 We can force the execution of the function without handling the error,
 but it's hugely not recommended.
 */
try! isValidPassword("1234567")