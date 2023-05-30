import SwiftUI

struct BalanceView: View {
    var text:String
    var number:Double
    let limit:Double
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "equal.circle")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(.blue)
                    .cornerRadius(7.5)
                Spacer()
                if text == "потратил"{
                    Text("\(number, specifier: "%.2f")")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }else{
                    Text("\(limit-number, specifier: "%.2f")")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
            }
            HStack{
                Text("\(text)")
                    .foregroundColor(.gray)
                    .textCase(.uppercase)
                    .dynamicTypeSize(.small)
            }.padding(.top, 5)
        }
        .padding(10)
        .padding(.vertical, 5)
        .background(Color("colorBalanceBG"))
        .cornerRadius(10)
        
    } 
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(text: "someText", number: 2, limit: 9000)
    }
}
