import Cocoa

let fruitsOnTheTable = ["Apple", "Banana", "Apple", "Orange", "Orange"]

print("The number of fruits on the table: \(fruitsOnTheTable.count)")

let uniqueFruitsOnTheTable = Set(fruitsOnTheTable)

print("The number of unique fruits on the table: \(uniqueFruitsOnTheTable.count)")
