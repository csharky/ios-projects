import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func findLuckyNumbers(numbers: [Int]) -> [Int]{
    return numbers
        .filter { $0 % 2 != 0 }
        .sorted { $0 < $1 }
}

let strings = findLuckyNumbers(numbers: luckyNumbers).map { "\($0) is a lucky number" }

for string in strings {
    print(string)
}
