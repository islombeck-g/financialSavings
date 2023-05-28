
import Foundation
import CoreData


class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "Waste")
    
    
    init(){
        container.loadPersistentStores{desc, error in
            if let error = error{
                print("failed load data \(error.localizedDescription)")
            }
            
        }
    }
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("dataSaved")
        }catch{
            print("dataSave ERROR,ERROR,ERROR,ERROR,ERROR")
        }
    }
    
    func addWaste(category: String, count: Double, note:String, context:NSManagedObjectContext){
        let waste = Waste(context:context)
        waste.id = UUID()
        waste.category = category
        waste.count = count
        waste.note = note
        waste.date = Date()
        save(context: context)
    }
    
    
    
}

