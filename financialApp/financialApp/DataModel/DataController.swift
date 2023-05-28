import Foundation
import CoreData

class DataController:ObservableObject{
    
    @Published var savedEntities:[WasteEntity] = []
    let container:NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "WasteData")
        container.loadPersistentStores{(desc, error) in
            if error != nil{
                print("ERRROOOORRR")
            }
        }
        fetchWaste()
    }

    func fetchWaste(){
        let request = NSFetchRequest<WasteEntity>(entityName: "WasteEntity")
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("error \(error)")
        }
    }
    func addWaste(category: String, count: Double, note:String){
        let waste = WasteEntity(context:container.viewContext)
        waste.id = UUID()
        waste.category = category
        waste.count = count
        waste.note = note
        waste.date = Date()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchWaste()
            print("Data saved successfully.")
        } catch let error {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
    
//    func editWaste(waste:Waste, count:Double, category:String, note:String, context:NSManagedObjectContext){
//        waste.count = count
//        waste.category = category
//        waste.note = note
//        save(context: context)
//    }
    
}

