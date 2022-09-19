import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    func speak(){
        print("bark-bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("bark-bark (like corgi)")
    }
}

class Poodle: Dog {
    override func speak() {
        print("bark-bark (like poodle)")
    }
}

class MaineCoon: Cat {
    override func speak() {
        print("meow-meow-meow i'm maine coon")
    }
}

class Lion: Cat {
    override func speak() {
        print("MEEEEOOOWWWW")
    }
}

var dog: Dog = Poodle(legs: 4)
dog.speak()
dog = Corgi(legs: 4)
dog.speak()

var cat: Cat = Lion(isTame: true, legs: 4)
cat.speak()
print("Is this cat tame? \(cat.isTame)")

cat = MaineCoon(isTame: false, legs: 4)
cat.speak()
print("Is this cat tame? \(cat.isTame)")
