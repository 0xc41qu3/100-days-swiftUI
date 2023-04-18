/**
 Checkpoint 7
 • Make a class hierarchy for animals.
 • Start with Animal. Add a legs property for the number of legs an animal has.
 • Make Dog a subclass of Animal, giving it a speak method that prints a dog barking string, but each subclass should print something different.
 • Make Corgi and Poodle subclasses of Dog.
 • Make Cat an Animal subclass. Add a speak method, with each subclass printing something different, and an `isTame` Boolean, set with an initializer.
 • Make Persian and Lion as subclasses of Cat.
 */

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        print("The animal is speaking...")
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    override func speak() {
        print("The dog is barking...")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    override func speak() {
        print("The cat is meowing...")
    }
}

class Corgi: Dog {
    override func speak() {
        print("The corgi is barking... 🐶")
    }
}

class Poodle: Dog {
    override func speak() {
        print("The poodle is barking...")
    }
}

class Persian: Cat {
    override func speak() {
        print("The persian is meowing...")
    }
}

class Lion: Cat {
    override func speak() {
        print("The lion is roaring...")
    }
}

Animal(legs: 4).speak() //The animal is speaking...
Dog().speak() //The dog is barking...
Corgi().speak() //The corgi is barking... 🐶
Poodle().speak() //The poodle is barking...
Cat(isTame: true).speak() //The cat is meowing...
Persian(isTame: true).speak() //The persian is meowing...
Lion(isTame: false).speak() //The lion is roaring...