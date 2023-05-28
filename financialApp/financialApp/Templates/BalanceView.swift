import SwiftUI

struct BalanceView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "equal.circle")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(.blue)
                    .cornerRadius(7.5)
                Spacer()
                Text("1.000$")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            HStack{
                Text("сумма на счеТу")
                    .foregroundColor(.gray)
                    .textCase(.uppercase)
                    .dynamicTypeSize(.small)
            }.padding(.top, 5)
        }
        .padding(10)
        .padding(.vertical, 5)
        .background(.white)
        .cornerRadius(10)
        
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
