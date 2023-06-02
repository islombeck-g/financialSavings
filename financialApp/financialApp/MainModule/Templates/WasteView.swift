
import SwiftUI

struct WasteView: View {
    var wast: FetchedResults<WasteEntity>.Element
    let defaultCategories = Category.defaultCategories
    var body: some View {
        HStack{
            Spacer()
                .frame(width:1)
            Rectangle()
                .foregroundColor(Color("\(self.findColor(for: defaultCategories, with: wast.category!))"))
                .frame(width: 6.5, height: 51)
            Spacer()
                .frame(width:10)
            Image(systemName: self.findIcon(for: defaultCategories, with: wast.category ?? "car"))
                    .frame(width: 30, height: 30)
                    .background(Color("\(self.findColor(for: defaultCategories, with: wast.category!))"))
                    .cornerRadius(7.5)
            Spacer()
                .frame(width:10)
            Text("\(wast.category!)")
            Spacer()
            Text("\(wast.count.formatted()) ₽")
                .font(.system(size: 21))
                .fontWeight(.bold)
            
        }

        .frame(height: 43)
        
    }
    func findIcon(for categoryArray: [Category], with name: String) -> String {
        return categoryArray.first(where: { $0.name == name })!.icon
    }
    func findColor(for categoryArray: [Category], with name: String) -> String {
        return categoryArray.first(where: { $0.name == name })!.color    }
}

//struct WasteView_Previews: PreviewProvider {
//    static var previews: some View {
//        WasteView()
//    }
//}
//
//struct Previews_WasteView_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
