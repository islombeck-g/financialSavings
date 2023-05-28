//
//import Foundation
//import SwiftUI
//import CoreData
//
//class HomeViewModel: ObservableObject {
//    @Published var wasteList = [Waste]()
//    let managedObjectContext: NSManagedObjectContext
//    
//    init(context: NSManagedObjectContext) {
//        self.managedObjectContext = context
//        refresh()
//    }
//    
//    func refresh() {
//        let fetchRequest: NSFetchRequest<Waste> = Waste.fetchRequest()
//        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Waste.date, ascending: false)]
//        do {
//            self.wasteList = try self.managedObjectContext.fetch(fetchRequest)
//            print(wasteList)
//        } catch {
//            print("Failed to fetch waste data: \(error.localizedDescription)")
//        }
//    }
//}
//
