import Foundation
import RealmSwift

class RealmData: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
