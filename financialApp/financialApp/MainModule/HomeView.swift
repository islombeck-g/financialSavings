
import SwiftUI
import CoreData


struct HomeView: View {
    
    @State private var showAddView = false
    @StateObject var dataController = DataController()
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 165))]) {
                        BalanceView()
                        BalanceView()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    List {
                        ForEach(dataController.savedEntities) { waste in
                            NavigationLink(destination: EditWasteVeiw(waste: waste)) {
                                WasteView(wast: waste)
                            }
                        }.onDelete(perform: deleteWaste)
                    }
                    .listStyle(.plain)
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            showAddView.toggle()
                        }label: {
                            ZStack{
                                Circle()
                                    .frame(width: 55, height: 55)
                                    .foregroundColor(Color("colorBalanceText"))
                                Image(systemName: "plus")
                                    .foregroundColor(Color("colorBG"))
                                    .font(.system(size: 30))
                            }
                        }.padding(.all, 25)
                    }
                }
                
                
                
                
            }
            .sheet(isPresented: $showAddView) {
                AddWasteView(dataController: dataController)
            }
        }
    }
    private func deleteWaste(offset:IndexSet){
        //later
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
