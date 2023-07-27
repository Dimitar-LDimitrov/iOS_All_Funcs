import Foundation

class ToDoItemCell : Encodable, Decodable {
    
    var title: String = ""
    var isChecked: Bool = false
}
