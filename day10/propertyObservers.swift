//Property Observers
struct Game {
    var score = 0 {
        //This code block will always run when the new property value is about to be set.
        willSet {
            print("New score: \(newValue)")
            /**
             We also can access the old value using the property reference: score -- in this case.
             e.g. print("Previous score: \(score)")
             */
        }
        //This code block will always run when the property value has just changed.
        didSet {
            print("Previous score: \(oldValue)")
            print()
        }
    }
    
    // P.S. Makes no sense to attach a property observer to a constant
    // property (`let`) since it will never change.
}

var game = Game()
game.score += 30
game.score += 60