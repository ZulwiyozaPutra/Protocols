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
    
    func pay() -> (basPay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
        return (0, 0, 0, 0)
    }
}

func payEmployee(employee: Employee) -> Void {
    let paycheck = employee.pay()
}

class HourlyEmployee: Employee {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.0
    var availableVacaion: Int = 0
    
    override func pay() -> (basPay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
        return (hourlyWage * hoursWorked, 0, 0, availableVacaion )
    }
}

//let hourlyEmployee = HourlyEmployee(fullName: "Zulwiyoz", employeeAddress: <#T##String#>, employeeStartDate: <#T##NSDate#>, employeeType: <#T##EmployeeType#>)



enum Level {
    case good
    case bad
}

enum Status {
    case excellent
    case okay
    case bad
}





func opportunity(gpa: Double?, yokiQuality: Level) -> Status {
    if gpa == nil {
        switch yokiQuality {
        case Level.good:
            return Status.okay
        case Level.bad:
            return Status.bad
        }
    } else {
        switch yokiQuality {
        case Level.good:
            return Status.excellent
        case Level.bad:
            return Status.bad
        }
    }
}

opportunity(3.2, yokiQuality: Level.good)