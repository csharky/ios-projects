import Cocoa

func randomElement(from array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }

print("Random element from missing array: \(randomElement(from: nil))")
print("Random element from empty array: \(randomElement(from: []))")
print("Random element from simple array: \(randomElement(from: [1, 2, 3, 4]))")
