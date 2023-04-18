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