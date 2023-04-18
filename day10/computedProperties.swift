//Computed properties
struct Bus {
    let seatingCapacity = 25
    var numberOfPassengers = 0
    
    var remainingSeats: Int {
        get {
            seatingCapacity - numberOfPassengers
        }
        set {
            /**
             `newValue` is provided automatically by Swift inside the setter block,
             containing the new value for the structure's property.
             */
            numberOfPassengers = seatingCapacity - newValue
        }
    }
    
    /**
     If we don't need to establish a logic for the setting operation,
     we can write without the blocks for each process:
     
     var remainingSeats: Int {
        seatingCapacity - numberOfPassengers
     }
     */
}

var bus33 = Bus()

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 0
print(bus33.remainingSeats) // 25

bus33.numberOfPassengers = 10

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 10
print(bus33.remainingSeats) // 15

bus33.remainingSeats = 5

print(bus33.seatingCapacity) // 25
print(bus33.numberOfPassengers) // 20
print(bus33.remainingSeats) // 5