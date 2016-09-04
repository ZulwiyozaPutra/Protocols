protocol FullyNameable {
    var fullName: String { get }
}

struct User: FullyNameable {
    var fullName: String
}

let user = User(fullName: "Zulwiyoza Putra")

struct Friend {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName ?? nil) \(lastName)"
    }
}

let friend = Friend(firstName: "Zulwiyoza", middleName: "mid" , lastName: "Putra")
friend.fullName

//Challenge

protocol UserType {
    var name: String { get }
    var age: Int { get set }
}

struct Person: UserType {
    let name: String
    var age: Int
}

let somePerson = Person(name: "Zulwiyoza Putra", age: 21)

/***************************************************************************/

import Foundation

protocol Payable {
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int)
}

enum EmployeeType {
    case Manager
    case NotManager
}

class Employee {
    
    let name: String
    let address: String
    let startDate: NSDate
    let type: EmployeeType
    
    var department: String?
    var reportsTo: String?
    
    init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: EmployeeType) {
        self.name = fullName
        self.address = employeeAddress
        self.startDate = employeeStartDate
        self.type = employeeType
    }
    
//    func pay() -> (basePay: Double, benefits: Double, deduction: Double, vacationTime: Int) {
//        return (0, 0, 0, 0)
//    }

}


func payEmployee(employee: Payable) -> Void {
    let paycheck = employee.pay()
    print(paycheck)
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 10
    var availableVacaion: Int = 0
    
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
        return (hourlyWage * hoursWorked, 0, 0, availableVacaion)
    }
}

let hourlyEmployee = HourlyEmployee(fullName: "Zulwiyoza Putra", employeeAddress: "no", employeeStartDate: NSDate(), employeeType: EmployeeType.NotManager)
payEmployee(hourlyEmployee)

let employee = Employee(fullName: "Zulwiyoza Putra", employeeAddress: "some address", employeeStartDate: NSDate(), employeeType: EmployeeType.NotManager)

/******************************************************/

//PROTOCOL CHALLENGE

// Declare protocol here

protocol ColorSwitchable {
    func switchColor(color: Color)
}

enum LightState {
    case On
    case Off
}

enum Color {
    case RGB(Double, Double, Double, Double)
    case HSB(Double, Double, Double, Double)
}

class WifiLamp: ColorSwitchable {
    var state: LightState
    var color: Color
    
    init() {
        self.state = LightState.On
        self.color = Color.RGB(0,0,0,0)
    }
    
    func switchColor(color: Color) {
        self.color = Color.RGB(121, 0, 0, 0)
    }
}


/******************************************************/


protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm a mush")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I'm stil milk after blended")
    }
}

func makeSmoothie(ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
        print("\(ingredient) is blended")
    }
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk]

makeSmoothie(ingredients)


/******************************************************/


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 129968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
d6.roll()
d6.roll()
d6.roll()