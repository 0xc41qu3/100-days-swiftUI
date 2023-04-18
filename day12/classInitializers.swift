//Class initializers
class Vehicle {
    var isEletric: Bool
    
    init(isEletric: Bool) {
        self.isEletric = isEletric
    }
}

class Car: Vehicle {
    let isConvertable: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertable = isConvertible
        super.init(isEletric: isElectric)
    }
}
let tesla = Car(isElectric: true, isConvertible: false)

//When our subclass doesn't need an initializer, it automatically inherits its parent's initializer.
class Motorcycle: Vehicle {}
let harley = Motorcycle(isEletric: false)