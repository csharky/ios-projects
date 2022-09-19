import Cocoa

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func sqrt(_ number: Int) throws -> Int {
    let min = 1;
    let max = 10000;
    
    if (number < min || number > max){
        throw SqrtError.outOfBounds
    }
    
    if (number == 1) {
        return 1
    }
    if (number == 10000) {
        return 100
    }
    
    var left = 1
    var right = 100
    
    while (left < right){
        let index = (left + right) / 2
        let pow = index * index
        
        if (pow > number){
            right = index - 1
        } else if (pow < number){
            left = index + 1
        } else {
            return index
        }
    }
    
    let finalTry = left * right
    if (finalTry == number){
        return finalTry
    }
    
    throw SqrtError.noRoot
}

do {
    let result = try sqrt(9800)
    print(result)
} catch SqrtError.outOfBounds {
    print("Error: out of bounds")
} catch SqrtError.noRoot {
    print("Error: no root")
}
