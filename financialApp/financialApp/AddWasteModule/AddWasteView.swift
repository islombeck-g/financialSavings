//
//  AddWasteView.swift
//  financialSavings
//
//  Created by Islombek Gofurov on 25.05.2023.
//

import SwiftUI

struct AddWasteView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    @StateObject var addWasteViewModel = AddWasteViewModel()
    @State private var count:String = ""
    @State private var category:String = ""
    @State private var note:String = ""
    let defaultCategories: [Category] = [
        Category(name: "Car", icon: "car", color: "colorBlue"),
        Category(name: "Bank", icon: "creditcard", color: "colorBlue1"),
        Category(name: "Супермаркеты", icon: "cart", color: "colorPurple"),
        Category(name: "Clothing and footwear", icon: "backpack", color: "colorBrown1"),
        Category(name: "Еда вне дома", icon: "popcorn", color: "colorYellow2")
    ]
    @State private var selectedCategory:String = "Супермаркеты"
    var body: some View {
        NavigationStack{
            VStack{
                
                Group{
                    Spacer()
                        .frame(height: 40)
                    HStack{
                        Text("Введите сумму:")
                        Spacer()
                    }
                    TextField("100", text: $count)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                            .stroke(.gray, lineWidth: 1.0))
                        .keyboardType(.numberPad)
                        .scrollDismissesKeyboard(.immediately)
                }
                Group{
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Text("Введите заметку:")
                        Spacer()
                    }
                    TextField("не забудь заполнитья, а то будешь потом вспоминать", text:$note)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.gray, lineWidth: 1.0))
                }
                Group{
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Picker("Category", selection: $selectedCategory){
                            ForEach(defaultCategories, id: \.self){category in
                                HStack{
                                    Image(systemName: "\(category.icon)")
                                        .frame(width: 30, height: 30)
                                        .background(Color("\(category.color)"))
                                        .cornerRadius(7.5)
                                    Text("\(category.name)")
                                        
                                    
                                }.tag(category.name)
                            }
                        }
                        .foregroundColor(.black)
                        .pickerStyle(.navigationLink)
                        
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.gray, lineWidth:1.0))
                }
                
                
                Spacer()
            }.padding(.horizontal, 20)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            dismiss()
                        }label: {
                        Text("Отменить")
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            if !count.isEmpty{
                                addWasteViewModel.addToAppStorage(count: Double(count)!, note: note, category: selectedCategory)
                            }
                            
                           dismiss()
                            
                        }label: {
                        Text("Добавить")
                        }
                    }
                }

        }
    }
}

struct AddWasteView_Previews: PreviewProvider {
    static var previews: some View {
        AddWasteView()
    }
}
