
import SwiftUI

struct WasteView: View {
    var wast: FetchedResults<WasteEntity>.Element
    let defaultCategories = Category.defaultCategories
    var body: some View {
        HStack{
            Spacer()
                .frame(width:20)
            Rectangle()
                .frame(width: 7.5)
            Spacer()
                .frame(width:10)
            Image(systemName: "(\(String(describing: wast.category))")
                    .frame(width: 30, height: 30)
                    .background(Color("colorGreen"))
                    .cornerRadius(7.5)
            Spacer()
                .frame(width:10)
            Text("some")
            Spacer()
            Text("100 ₽")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
            
            
        }.frame(width: .infinity, height: 40)
    }
}

//struct WasteView_Previews: PreviewProvider {
//    static var previews: some View {
//        WasteView()
//    }
//}
