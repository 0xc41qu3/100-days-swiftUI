/**
 Guard

 We also use them to ensure that variables or constants have a value in the current scope we're working on.
 
 1. We must always return when the values are not available to work with.
 2. The safe variable or constant will be available after the guard block.
 */
func safeNumber(_ optionalNumber: Int?) -> Int {
    guard let number = optionalNumber else {
        //First point:
        return -1
    }
    
    //Second point:
    return number
}

let number: Int? = nil
safeNumber(number) //returns -1.
safeNumber(3) //returns 3.
