/**
 Classes
  
 Five main differences compared to structures:
 1. You can make one class build upon functionality in another class (inheritance).
 2. Swift won't generate a memberwise initializer for classes.
 3. If we copy an instance of a class, both copies share the same data -- it works as only a reference.
 4. We can add a deinitializer to run when the final reference (an instance) to a data is destroyed.
 5. Constant class instances can have their variable properties changed.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

let game = Game()
game.score += 10 //It would fail if we had a struct because the instance is stored in a constant (fifth difference).