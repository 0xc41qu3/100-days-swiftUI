//><-- Arrays --><
var numbersA = Array<Int>()
numbersA.append(1)
numbersA.append(2)
numbersA.append(3)

let numbersB = [1,2,3]

var numbersC = [Int]()
numbersC.append(1)
numbersC.append(2)
numbersC.append(3)

let numbersD: Array<Int> = Array(repeating: 0, count: 3)

print(numbersA.count, numbersB.count, numbersC.count, numbersD.count)