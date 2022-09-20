import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var nameOfEstateAgent: String { get }
    
    func printSalesSummary()
}

struct House: Building {
    let rooms: Int
    let nameOfEstateAgent: String
    var cost: Int
    
    mutating func changeCost(cost: Int) {
        self.cost = cost
    }
    
    func printSalesSummary() {
        print("House summery:\n Rooms: \(rooms)\n Cost: $\(cost)\n Estate agent: \(nameOfEstateAgent)")
    }
}

struct Office: Building {
    let rooms: Int
    let nameOfEstateAgent: String
    var cost: Int
    
    mutating func changeCost(cost: Int) {
        self.cost = cost
    }
    
    func printSalesSummary() {
        print("Office summery:\n Rooms: \(rooms)\n Cost: $\(cost)\n Estate agent: \(nameOfEstateAgent)")
    }
}

var building: Building = House(rooms: 10, nameOfEstateAgent: "Mike", cost: 1_000_000)
building.printSalesSummary()

building = Office(rooms: 30, nameOfEstateAgent: "Julia", cost: 5_000_000)
building.printSalesSummary()

