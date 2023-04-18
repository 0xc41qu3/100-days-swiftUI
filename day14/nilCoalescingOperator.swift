//Nil coalescing operator

let numberInFullVersion = [
    1:"one",
    2:"two",
    3:"three"
]

let result = numberInFullVersion[10, default: "Not found"]

//or using the nill coalescing operator:
let result1 = numberInFullVersion[10] ?? "Not found"
