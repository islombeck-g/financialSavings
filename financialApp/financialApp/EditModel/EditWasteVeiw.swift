
import SwiftUI

struct EditWasteVeiw: View {
    
    var waste: FetchedResults<WasteEntity>.Element
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(waste.count)" )
                        .font(.title)
                    
                    Divider()
                    
            Text(waste.note ?? "")
                        .padding(.top)
                    
                    Spacer()
                }
    }
    
}

//struct EditWasteVeiw_Previews: PreviewProvider {
//    static var previews: some View {
//        EditWasteVeiw()
//    }
//}
