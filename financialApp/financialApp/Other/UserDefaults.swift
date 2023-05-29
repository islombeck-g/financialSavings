//
//  UserDefaults.swift
//  financialApp
//
//  Created by Islombek Gofurov on 29.05.2023.
//

import Foundation


class UserDefaultsClass:ObservableObject{
  
    @Published var number: Double {
            didSet {
                UserDefaults.standard.set(number, forKey: "number")
            }
        }
    @Published var limit: Double {
            didSet {
                UserDefaults.standard.set(limit, forKey: "limit")
            }
        }
    init() {
            self.number = UserDefaults.standard.double(forKey: "number")
            self.limit = UserDefaults.standard.double(forKey: "limit")
        }
   
}
