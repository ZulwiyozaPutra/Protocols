protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}

struct User: PrettyPrintable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "name: \(name)\nage: \(age)\naddress: \(address)"
    }
}

let user = User(name: "Zulwiyoza", age: 21, address: "411 O'Farrell")

print(user.description())
print(user.prettyDescription())
