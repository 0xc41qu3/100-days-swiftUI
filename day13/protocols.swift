/**
 Protocols
 Establish the properties and methods each structure or class must implement to conform to.
 
 - Must be placed after superclasses;
 - Must not specify the implementations, only the signature for functions and types to properties;
 - Both classes and structures can use protocols;
 - Additional methods and properties are allowed.
 */
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Double) -> Double
    func travel(distance: Double)
}

protocol CanBeEletric {
    var isEletrict: Bool { get }
}

struct Car: Vehicle, CanBeEletric {
    let name = "Car"
    let isEletrict: Bool
    var currentPassengers = 1
    
    func estimateTime(for distance: Double) -> Double {
        distance / 50
    }
    
    func travel(distance: Double) {
        print("I'm driving \(distance)km...")
    }
    
    //Example of the additional method.
    func checkTires() {
        print("All tires are inflated 🫡")
    }
}

struct Bicycle: Vehicle, CanBeEletric {
    let name = "Bike"
    let isEletrict: Bool
    var currentPassengers = 1
    
    func estimateTime(for distance: Double) -> Double {
        distance / 10
    }
    
    func travel(distance: Double) {
        print("I'm cycling \(distance)km")
    }
}

/**
 We can specify a parameter's type as a protocol, so any data type that conforms to the protocol
 can be used as a parameter.
 */
func getTravelEstimates(using vehicles: [Vehicle], distance: Double) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car(isEletrict: true)
let bike = Bicycle(isEletrict: false)

getTravelEstimates(using: [car, bike], distance: 180)