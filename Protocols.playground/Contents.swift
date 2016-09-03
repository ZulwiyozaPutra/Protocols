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
