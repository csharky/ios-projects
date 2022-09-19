import Cocoa

struct Car {
    public let model: String
    public let numberOfSeats: Int
    public let maxGear: Int
    
    private(set) var currentGear: Int;
    
    private let minGear = 1;
    
    init(model: String, numberOfSeats: Int, maxGear: Int){
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.maxGear = maxGear
        
        currentGear = minGear;
    }
    
    mutating func gearUp(){
        let nextGear = currentGear + 1;
        
        if (canChangeGearTo(nextGear)){
            currentGear = nextGear;
        } else {
            print("Oops, you've reached the max gear")
        }
    }
    
    
    mutating func gearDown(){
        let nextGear = currentGear - 1;
        
        if (canChangeGearTo(nextGear)){
            currentGear = nextGear;
        } else {
            print("Oops, you've reached the min gear")
        }
    }
    
    private func canChangeGearTo(_ nextGear: Int) -> Bool { nextGear >= minGear && nextGear <= maxGear }
}

var myCar = Car(model: "Tesla", numberOfSeats: 4, maxGear: 6)

myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()

print("I'm driving my \(myCar.model) with current gear equal to \(myCar.currentGear)")

myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()

