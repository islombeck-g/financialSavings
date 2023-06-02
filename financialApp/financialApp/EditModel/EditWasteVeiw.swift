import SwiftUI

struct EditWasteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let waste: FetchedResults<WasteEntity>.Element
    let defaultCategories = Category.defaultCategories
    @ObservedObject var dataController: DataController
    @State private var count:Double = 0.0
    @State private var category:String = ""
    @State private var note:String = ""
    @State private var date:Date = Date()
    
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .foregroundColor(Color(findColor(for: defaultCategories, with: category)))
                    .frame(width: 6.5, height: 51)
                
                Image(systemName: findIcon(for: defaultCategories, with: category))
                    .frame(width: 30, height: 30)
                    .background(Color(findColor(for: defaultCategories, with: category)))
                    .cornerRadius(7.5)
                
                Spacer()
                    .frame(width:10)
                
                Text("\(category)")
                
                Spacer()
                
                Text("\(count.formatted()) ₽")
                    .font(.system(size: 21))
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color("colorBalanceBG"))
            .cornerRadius(10)
            
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(Color(findColor(for: defaultCategories, with: category)))
                Text("\(date.formatted())")
                Spacer()
            }
            .padding()
            .background(Color("colorBalanceBG"))
            .cornerRadius(10)
            
            if !note.isEmpty {
                HStack{
                    Text(note)
                    Spacer()
                }            .padding()
                    .background(Color("colorBalanceBG"))
                    .cornerRadius(10)
                
                
            }
            
            Spacer()
        }
        .onAppear{
            count = waste.count
            category = waste.category!
            note = waste.note ?? ""
            date = waste.createDate!
        }
        .padding()
        .background(Color("colorBG"))
        
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{

                    self.presentationMode.wrappedValue.dismiss()
                    dataController.deleteWaste(waste: waste)
                }label:{
                    Image(systemName: "minus")
                }
            }
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    dataController.editWaste(waste: waste, count: count, category: category, note: note)
                    self.presentationMode.wrappedValue.dismiss()
                }label:{
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Назад")
                    }
                }
            }
            
        }
        
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
//struct EditWasteVeiw_Previews: PreviewProvider {
//    static var previews: some View {
//        let waste = WasteEntity(context: DataController().container.viewContext)
//        return EditWasteVeiw(waste: waste)
//    }
//}
