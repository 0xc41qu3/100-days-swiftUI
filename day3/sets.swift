//><-- Sets --><
var setA = Set<Int>()
setA.insert(0)
setA.insert(1)
setA.insert(2)

let setB = Set([0, 1, 2])

//No duplicates are allowed.

let setC = Set([1, 2, 3, 1, 2, 3])
print(setC.count) // 3