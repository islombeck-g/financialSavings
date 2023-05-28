//
//  Categories.swift
//  financialSavings
//
//  Created by Islombek Gofurov on 27.05.2023.
//
//class Category: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id: ObjectId = ObjectId.generate()
//    @Persisted var name: String = ""
//    @Persisted var icon: String = ""
//    @Persisted var color: String = ""
//    @Persisted var type: CategoryType = .expense
//    @Persisted var transactions: List<TransactionItem> = List<TransactionItem>()
//}
import Foundation

class Category:Hashable{
   
    static func == (lhs: Category, rhs: Category) -> Bool {
           return lhs.name == rhs.name && lhs.icon == rhs.icon && lhs.color == rhs.color
       }
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(icon)
           hasher.combine(color)
       }
    var name:String
    var icon:String
    var color:String
    
    init(name: String, icon: String, color: String) {
        self.name = name
        self.icon = icon
        self.color = color
    }
}





//let carCategory = Category(value: ["name": "Car" , "icon": "car", "color": "colorBlue"])
//let bankCategory = Category(value: ["name": "Bank", "icon": "creditcard", "color": "colorBlue1"])
//let supermarketCategory = Category(value: ["name": "Супермаркеты", "icon": "cart", "color": "colorPurple"])
//let clothingCategory = Category(value: ["name": "Clothing and footwear", "icon": "backpack", "color": "colorBrown1"])
//let eatingOutCategory = Category(value: ["name": "Еда вне дома", "icon": "popcorn", "color": "colorYellow2"])
//
//let defaultCategories = [carCategory, bankCategory, supermarketCategory, clothingCategory, eatingOutCategory]
//let defaultCategories: [Category] = [
//    Category(value: ["name": "Car" , "icon": "car", "color": "colorBlue"] as [String: Any]),
//    Category(value: ["name": "Bank", "icon": "creditcard", "color": "colorBlue1"] as [String: Any]),
//    Category(value: ["name": "Супермаркеты", "icon": "cart", "color": "colorPurple"] as [String: Any]),
//    Category(value: ["name": "Clothing and footwear", "icon": "backpack", "color": "colorBrown1"] as [String: Any]),
//    Category(value: ["name": "Еда вне дома", "icon": "popcorn", "color": "colorYellow2"] as [String: Any])
//]

//
//let defaultCategories = {
//    [
//        Category(value: ["name": "Car" , "icon": "car", "color": "colorBlue"]),
//        Category(value: ["name": "Bank", "icon": "creditcard", "color": "colorBlue1"]),
//        Category(value: ["name": "Супермаркеты", "icon": "cart", "color": "colorPurple"]),
//        Category(value: ["name": "Clothing and footwear", "icon": "backpack", "color": "colorBrown1"]),
//        Category(value: ["name": "Еда вне дома", "icon": "popcorn", "color": "colorYellow2"])
//    ]
//}
//
//Category(value: ["name": vness services", comment: "Business services"), "icon": "person.2", "color": "colorBlue2", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Charity", comment: "Charity"), "icon": "figure.roll", "color": "colorGreen", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("State", comment: "State"), "icon": "network.badge.shield.half.filled", "color": "colorGreen1", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Children", comment: "Children"), "icon": "figure.2.and.child.holdinghands", "color": "colorGreen2", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("House", comment: "House"), "icon": "house", "color": "colorYellow", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Pets", comment: "Pets"), "icon": "fish", "color": "colorYellow1", "type": CategoryType.expense] as [String : Any]),
//
//Category(value: ["name": NSLocalizedString("Health", comment: "Health"), "icon": "heart", "color": "colorRed", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Beauty", comment: "Beauty"), "icon": "fleuron", "color": "colorRed1", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Mobile connection", comment: "Mobile connection"), "icon": "wifi", "color": "colorRed2", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Education", comment: "Education"), "icon": "book", "color": "colorBrown", "type": CategoryType.expense] as [String : Any]),
//
//Category(value: ["name": NSLocalizedString("Present", comment: "Present"), "icon": "gift", "color": "colorBrown2", "type": CategoryType.expense] as [String : Any]),
//
//Category(value: ["name": NSLocalizedString("Trips", comment: "Trips"), "icon": "airplane", "color": "colorPurple1", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Entertainment", comment: "Entertainment"), "icon": "music.mic", "color": "colorPurple2", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Technique", comment: "Technique"), "icon": "display", "color": "colorGray", "type": CategoryType.expense] as [String : Any]),
//Category(value: ["name": NSLocalizedString("Transport", comment: "Transport"), "icon": "bus.fill", "color": "colorGray1", "type": CategoryType.expense] as [String : Any])
