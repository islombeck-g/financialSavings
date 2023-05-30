import Foundation

class Category:Hashable{
    
    //    @Published var defaultCategories: [Category] = [
    //        Category(name: "Супермаркеты", icon: "cart", color: "colorRed2"),
    //        Category(name: "Забегаловки", icon: "fork.knife", color: "colorBlue1"),
    //        Category(name: "Транспорт", icon: "car", color: "colorYellow1"),
    //        Category(name: "Досуг", icon: "gamecontroller", color: "colorPurple"),
    //        Category(name: "Универ", icon: "text.book.closed.fill", color: "colorBrown1"),
    //        Category(name: "Потребности", icon: "house", color: "colorYellow2")
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
        Category(name: "Супермаркеты", icon: "cart", color: "colorRed2"),
        Category(name: "Забегаловки", icon: "fork.knife", color: "colorBlue1"),
        Category(name: "Транспорт", icon: "car", color: "colorYellow1"),
        Category(name: "Досуг", icon: "gamecontroller", color: "colorPurple"),
        Category(name: "Универ", icon: "text.book.closed.fill", color: "colorBrown1"),
        Category(name: "Потребности", icon: "house", color: "colorYellow2")
        
    ]
}
