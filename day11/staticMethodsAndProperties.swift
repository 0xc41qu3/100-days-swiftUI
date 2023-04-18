/**
 Static method and properties
 With them, we can access properties or methods without needing to instantiate the class,
 such as sharing data and methods through the app.
 */

struct User {
    var username: String
    let password: String
    
    static var example = User(username: "dino_xyz", password: "123321")
    
    mutating func changeUsername(to newUsername: String){
        // When accessing instances' properties, we use `self` to refer to the current value of a struct.
        self.username = newUsername
    }
    
    /**
     Since this method doesn't change an instance kept in a constant or variable,
     flagging it as `mutating` is unnecessary.
     */
    func changeExampleUsername(to newUsername: String) {
        // When accessing static properties, we use `Self` to refer to the current struct type.
        Self.example.username = newUsername
        // or
        // User.example.username = newUsername
    }
}
//Let's imagine we're creating a new view and mocking some data...
print("My username: \(User.example.username)")

//Example 2
struct AppData {
    static let version = "0.7"
    static let baseURL = "https://duckduckgo.com"
}

print("Current app version: \(AppData.version)")