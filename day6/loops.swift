//><-- Loops --><
let platforms = ["iOS", "macOS", "watchOS", "tvOS"]

for platform in platforms {
    print("The app is going to run on \(platform)")
}

// ranges
for i in 1...10 {
    print("The \(i) times table")
    
    for j in 1...10 {
        print("\t\(i) x \(j) = \(i * j)")
    }
    print()
}

//not inclusive range
for i in 0..<3 {
    print(i) // 0 1 2
}

//needless iterator reference
for _ in 1...2 {
    print("knock!")
}

//while loops
var diceFace = 0

while diceFace != 6 {
    print("Rolling the dice...")
    diceFace = Int.random(in: 1...6)
}

print("Dice hit the sixth face!")

//skipping iterations or stopping the loop
let number0 = 3
let number1 = 25
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number0) && i.isMultiple(of: number1) {
        multiples.append(i)
    }
    
    if multiples.count == 10 {
        break;
    }
}

print(multiples)

var evenMultiples = [Int]()

for multiple in multiples {
    if multiple % 2 != 0 {
        continue
    }
    
    evenMultiples.append(multiple)
}

print("The folliwng multiples are even: \(evenMultiples).")