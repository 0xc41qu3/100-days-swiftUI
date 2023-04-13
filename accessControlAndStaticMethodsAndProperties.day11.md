# Access Control and Static Methods and Properties in Swift

```swift
/**
 Access Control:
 It controls how the struct's methods and properties can be accessed from outside the struct.
 
 Summary:
    - private: don't let anything outisde the struct use this;
    - fileprivate: don't let anything outside the current file use this;
    - public: let anyone, anywhere use this;
    - private(set): Let the set occur only from inside the struct, but it gives access to anyone, anywhere, to read the property's value.
 */
struct BankAccount {
    private(set) var funds = 0.0
    
    mutating func deposit(_ amount: Double) {
        funds += amount
    }
    
    mutating func withdraw(_ amount: Double) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var bankAccount = BankAccount()

bankAccount.deposit(267)
//bankAccount.funds = -1000 -- It's no longer allowed.

if bankAccount.withdraw(1000) {
    print("The amount was withdrawn successfully!")
} else {
    print("Unavailable amount!")
}

print("Available funds: \(bankAccount.funds)")

// ---

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

// ---

/**
 Checkpoint 6
 
 • Create a struct to store information about a car. Include:
 • Its model
 • Number of seats
 • Current gear
 • Add a method to change gears up or down.
 • Have a think about variables and access control.
 • Don't allow invalid gears - 1... 10 seems a fair maximum range.
 */

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        
        if isAllowedGear(currentGear) {
            self.currentGear = currentGear
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    private func isAllowedGear(_ gear: Int) -> Bool {
        gear >= 1 && gear <= 10
    }
    
    mutating func changeGear(to newGear: Int) -> Bool {
        if isAllowedGear(newGear) {
            currentGear = newGear
            return true
        } else {
            return false
        }
    }
}

var carA = Car(model: "Fastback", numberOfSeats: 5)
var carB = Car(model: "HRV", numberOfSeats: 5, currentGear: 30)

print("Current gear (Car A): \(carA.currentGear)") // 1
print("Current gear (Car B): \(carB.currentGear)") // 1

//carA.model = "City" -- it's not allowed.
//carA.numberOfSeats = 7 -- it's not allowed.
//carA.currentGear = 8 -- it's not allowed.
```