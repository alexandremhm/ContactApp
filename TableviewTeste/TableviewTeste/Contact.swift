import UIKit

struct Contact {
    let name: String
    let telephone: String
}

extension Contact: Comparable {
    static func <(lhs: Contact, rhs: Contact) -> Bool {
        return lhs.name < rhs.name
    }
}
