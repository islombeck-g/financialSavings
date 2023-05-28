import Foundation

class Category:Hashable{
   
//    @Published var defaultCategories: [Category] = [
//        Category(name: "Car", icon: "car", color: "colorBlue"),
//        Category(name: "Bank", icon: "creditcard", color: "colorBlue1"),
//        Category(name: "Супермаркеты", icon: "cart", color: "colorPurple"),
//        Category(name: "Clothing and footwear", icon: "backpack", color: "colorBrown1"),
//        Category(name: "Еда вне дома", icon: "popcorn", color: "colorYellow2")
//    ]
    
    static func == (lhs: Category, rhs: Category) -> Bool {
           return lhs.name == rhs.name && lhs.icon == rhs.icon && lhs.color == rhs.color
       }
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(icon)
           hasher.combine(color)
       }
    var name:String = ""
    var icon:String = ""
    var color:String = ""
    
    init(name: String, icon: String, color: String) {
        self.name = name
        self.icon = icon
        self.color = color
    }
}
extension Category {
    static let defaultCategories: [Category] = [
        Category(name: "Car", icon: "car", color: "colorBlue"),
        Category(name: "Bank", icon: "creditcard", color: "colorBlue1"),
        Category(name: "Супермаркеты", icon: "cart", color: "colorPurple"),
        Category(name: "Clothing and footwear", icon: "backpack", color: "colorBrown1"),
        Category(name: "Еда вне дома", icon: "popcorn", color: "colorYellow2")
    ]
}
