
import SwiftUI
import CoreData


var spent:Double = 0

struct HomeView: View {
    @StateObject private var userDefaultsClass = UserDefaultsClass()
    @State private var showAddView = false
    @StateObject var dataController = DataController()
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView{
                        HStack{
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 165))]) {
                                BalanceView(text: "потратил", number: spent)
                                BalanceView(text: "до лимита", number:spent)
                            }
                        }.padding()
                    
                    VStack{
                        ForEach(dataController.savedEntities) { waste in
                            NavigationLink(destination: EditWasteVeiw(waste: waste)) {
                                
                                WasteView(wast: waste)
                                    
                                
                                
                                
                                
                            }
                        }.onDelete(perform: deleteWaste)
                            .padding(.horizontal, 15)
                        
                    }
                    .background(Color("colorBalanceBG"))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    
                }.background(Color("colorBG"))
                
                
                
                
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
                
                
                
                
            }.background(Color("colorBG"))
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
