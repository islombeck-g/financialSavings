import SwiftUI

struct EditWasteVeiw: View {
    
    let waste: FetchedResults<WasteEntity>.Element
    let defaultCategories = Category.defaultCategories
    
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .foregroundColor(Color(findColor(for: defaultCategories, with: waste.category ?? "")))
                    .frame(width: 6.5, height: 51)
                
                Image(systemName: findIcon(for: defaultCategories, with: waste.category ?? ""))
                    .frame(width: 30, height: 30)
                    .background(Color(findColor(for: defaultCategories, with: waste.category ?? "")))
                    .cornerRadius(7.5)
                
                Spacer()
                    .frame(width:10)
                
                Text("\(waste.category ?? "")")
                
                Spacer()
                
                Text("\(waste.count.formatted()) ₽")
                    .font(.system(size: 21))
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color("colorBalanceBG"))
            .cornerRadius(10)
        
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(Color(findColor(for: defaultCategories, with: waste.category ?? "")))
                Text("\(waste.createDate!.formatted())")
                Spacer()
            }
            .padding()
                .background(Color("colorBalanceBG"))
                .cornerRadius(10)
            
            if let note = waste.note, !note.isEmpty {
                HStack{
                    Text(note)
                    Spacer()
                }            .padding()
                    .background(Color("colorBalanceBG"))
                    .cornerRadius(10)

               
            }
            
            Spacer()
        }
        .padding()
        .background(Color("colorBG"))
    }
    
    func findIcon(for categoryArray: [Category], with name: String) -> String {
        return categoryArray.first(where: { $0.name == name })?.icon ?? "car"
    }
    
    func findColor(for categoryArray: [Category], with name: String) -> String {
        return categoryArray.first(where: { $0.name == name })?.color ?? "black"
    }
}






//
//import SwiftUI
//
//struct EditWasteVeiw: View {
//
//    var wast: FetchedResults<WasteEntity>.Element
//    let defaultCategories = Category.defaultCategories
//    var body: some View {
//        VStack{
//            Group{
//                HStack{
//                    Group{
//                        Spacer()
//                            .frame(width:1)
//                        Rectangle()
//                            .foregroundColor(Color("\(self.findColor(for: defaultCategories, with: wast.category!))"))
//                            .frame(width: 6.5, height: 51)
//                        Spacer()
//                            .frame(width:10)
//                    }
//                    Group{
//                        Image(systemName: self.findIcon(for: defaultCategories, with: wast.category ?? "car"))
//                            .frame(width: 30, height: 30)
//                            .background(Color("\(self.findColor(for: defaultCategories, with: wast.category!))"))
//                            .cornerRadius(7.5)
//                        Spacer()
//                            .frame(width:10)
//                        Text("\(wast.category!)")
//                        Spacer()
//                        Text("\(wast.count.formatted()) ₽")
//                            .font(.system(size: 21))
//                            .fontWeight(.bold)
//                    }
//                }
//                if !wast.note?.isEmpty{
//                    Text(wast.note!)
//                }
//
//            }
//            .padding()
//            .background(Color("colorBalanceBG"))
//            .cornerRadius(10)
////                    .frame(height: )
//            Spacer()
//
//        }
//        .padding()
//        .background(Color("colorBG"))
//    }
//    func findIcon(for categoryArray: [Category], with name: String) -> String {
//        return categoryArray.first(where: { $0.name == name })!.icon
//    }
//    func findColor(for categoryArray: [Category], with name: String) -> String {
//        return categoryArray.first(where: { $0.name == name })!.color    }
//}
//
////struct EditWasteVeiw_Previews: PreviewProvider {
////    static var previews: some View {
////        EditWasteVeiw(waste: DataController().savedEntities.randomElement()!)
////    }
////}
struct EditWasteVeiw_Previews: PreviewProvider {
    static var previews: some View {
        let waste = WasteEntity(context: DataController().container.viewContext)
        return EditWasteVeiw(waste: waste)
    }
}
