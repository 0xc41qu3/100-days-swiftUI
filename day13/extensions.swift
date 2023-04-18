/**
 Extensions
 
 Advantages:
 1. Code completion
 Xcode will suggest all the original methods/properties of the type and our extensions to that type.
 2. Code organization
 Instead of having global functions, we can group them by the extensions we create to specific types.
 3. Internal access
 We can access methods and properties without compliance with the access control settings since our extensions behave like a native implementation.
 
 ---
 
 Naming guideline:
 Method name + ed, e.g., `sorted()`:
 means the method returns a modified version of the given data.
 
 Method name (using bare infinitive), e.g., `sort()`:
 means the method modifies the data in-place,.
 */

extension String {
    enum Field {
        case username, password, name
    }
    
    static func randomized(_ field: Field) -> String {
        switch field {
        case .username:
            return "@anonymous"
        case .password:
            return "1@3$56&*"
        case .name:
            return "Andrew Jwitsky"
        }
    }
    
    func randomized(_ field: Field) -> String {
        String.randomized(field)
    }
    
    mutating func random(_ field: Field) {
        self = String.randomized(field)
    }
}

var inputText = String.randomized(.username) //@anonymous
inputText.randomized(.password) // returns "1@3$56&*"
inputText.random(.name) // set new value "Andrew Jwitsky"

/**
 Just in case we want to create a custom initializer but keep with the default
 memberwise initializer, we can extends the type and declare the custom ones
 inside the extension:
 */
struct User {
    let username: String
    let password: String
}

extension User {
    init(password: String) {
        self.password = password
        self.username = "anonymous_\(Int.random(in: 1...1_000))"
    }
}

User(username: "anonymous", password: "12345678") //allowed.
User(password: "12345678") //allowed.
