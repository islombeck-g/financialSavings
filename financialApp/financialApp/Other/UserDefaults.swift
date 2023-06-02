
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
        
        if let lastResetDate = UserDefaults.standard.object(forKey: "lastResetDate") as? Date {
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.month], from: lastResetDate, to: Date())
                    if components.month! > 0 {
                        self.number = 0
                        UserDefaults.standard.set(Date(), forKey: "lastResetDate")
                    }
                } else {
                    UserDefaults.standard.set(Date(), forKey: "lastResetDate")
                }
        
        }
    func updateLimit(newValue: Double) {
            limit = newValue
        }
    func increaseNumber(value:Double) {
            number += value
        }
    func decreaseNumber(value:Double) {
            number -= value
        }
}
