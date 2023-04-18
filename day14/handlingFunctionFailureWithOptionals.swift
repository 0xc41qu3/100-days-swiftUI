/**
 Handling function failure with optionals.
 
 If we don't care about the returned error of the function, we can freely use this approach.
 */
enum UserError: Error {
    case badID, networkFailed
}

func getUsername(id: Int) throws -> String {
    throw UserError.networkFailed
}

//This way, if the function throws any error, the stored value is an optional string.
let user = try? getUsername(id: 123)

//This way, if the function throws any error, we return a default value.
let user1 = (try? getUsername(id: 123)) ?? "Anonymous" //returns "Anonynmous".

if let username = try? getUsername(id: 123) {
    print("Logged user: \(username).")
}