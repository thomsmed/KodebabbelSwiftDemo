

// Constants VS variables
let constant = "This is a constant"
var variable = "This is a variable"


// Optional types
var optionalInt: Int?
optionalInt = 1

if optionalInt == nil {
    print("Value is nil")
}

let optionalInts = [nil, 1, nil, 3, nil, 5]

for value in optionalInts {
    guard let v = value else {
        continue
    }
    
    print("Value: \(v)")
}


// Structs are value types, and are immutable by default. Usually used for pure data structures
struct Bicycle {
    let name: String
    var color: Color? // Optional Color
    
    // Need to explisit mark function as mutating if you want it to have side effects
    mutating func changeColor(to newColor: Color?) {
        color = newColor
    }
}


// Classes are reference types. Usually contains some sort of logic
class MotorVehicle {
    let name: String
    var color: Color? // Optional Color
    var numberOfWheels: Int? // Optional Int
    
    init(name: String) {
        self.name = name
    }
}


// protocols are contracts both classes and structs can conform to
protocol Drive {
    func drive()
}


// Inheritance
class Motorcycle: MotorVehicle {
    init() {
        super.init(name: "Motorcycle")
        numberOfWheels = 2
    }
    
    deinit {
        numberOfWheels = 0
    }
}


// Extending an existing class
extension Motorcycle: Drive {
    func drive() {
        print("Driving a \(name) with \(numberOfWheels ?? 0) wheels")
    }
}


// Extending an existing struct
extension Bicycle: Drive {
    func drive() {
        print("Driving a \(name)")
    }
}


// Polymorphism
let bicycle = Bicycle(name: "Bicycle")
let motorcycle = Motorcycle()
var sometingThatCanDrive: Drive = bicycle
sometingThatCanDrive = motorcycle


// Enums can have associated values (nice for functional programming)
enum Color {
    case black
    case white
    case rgb(Int, Int, Int)
    case hex(String)
}


let color = Color.rgb(255, 0, 0)


// Switch on the enum to get the values:
switch color {
case .black:
    print("Black")
case .white:
    print("White")
case .rgb(let red, let green, let blue):
    print("Red: \(red), green: \(green), blue: \(blue)")
case var .hex(hex):
    hex = "#" + hex
    print("Hex: \(hex)")
}


// Functions are expressive and easy to read with named parameters
func write(_ message: String, to person: String) {
    print("\(message), \(person)")
}


let message = "Nice to see you"
let person = "Thomas"


write(message, to: person)


let greeting = "Greetings"
let thomas = "Thomas"


write(greeting, to: thomas)

