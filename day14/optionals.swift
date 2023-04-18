//Optionals
let stateByCity = [
    "são paulo" : "SP",
    "garulhos": "SP",
    "campinas": "SP"
]

let chosenCity = "garuhlos" // ⚠️ There's a typo.

//If we can unwrap the data successfully, the if statement body will run.
if let stateOfChosenCity = stateByCity[chosenCity] {
    print("The state of the chosen city is \"\(stateOfChosenCity)\".")
} else {
    print("No city has been chosen city.")
}

//`nil` represent a valueless state.
var days: Int? = nil

//The constant with the same name is allowed since it only belongs to the if statement's scope.
//This technique is called shadowing.
if let days = days {
    print("You'll be off for \(days) days.")
} else {
    print("Keep working...")
}