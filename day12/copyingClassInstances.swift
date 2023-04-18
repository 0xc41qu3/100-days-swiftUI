//How to copy class instances:
class User {
    var username = "Anonymous"
    
    //For fixing the reference copy problem:
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user = User()
var copiedUser = user

print(user.username) //Anonymous.
print(copiedUser.username) //Anonymous.

copiedUser.username = "ell13"

print(user.username) //ell13.
print(copiedUser.username) //ell13.

//P.S. If we had used a struct instead, the reference won't exist, so that wouldn't happen.

//Applying the solution for the reference problem:
var newUser = User()
var deepCopiedUser = newUser.copy()

print(newUser.username) //Anonymous.
print(deepCopiedUser.username) //Anonymous.

deepCopiedUser.username = "ell13"

print(newUser.username) //Anonymous.
print(deepCopiedUser.username) //ell13.