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

let friend