
import SwiftUI

struct HomeView: View {
    @State private var showAddView = false
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 165))]){
                        BalanceView()
                        BalanceView()
                    }
                    .padding(.horizontal)
                    .padding(.top)
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
            .background(.gray)
        }.sheet(isPresented: $showAddView){
            AddWasteView()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
