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