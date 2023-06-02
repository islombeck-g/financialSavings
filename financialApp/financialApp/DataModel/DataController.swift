import Foundation
import CoreData

class DataController:ObservableObject{
    
    @Published var userDefaults = UserDefaultsClass()
    @Published var savedEntities:[WasteEntity] = []
    let container:NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "WasteData")
        container.loadPersistentStores{(desc, error) in
            if error != nil{
                print("ERRROOOORRR")
            }
        }
        deleteAllData()
        userDefaults.updateLimit(newValue: 9000)
        fetchWaste()
    }
    func deleteAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "WasteEntity")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try container.viewContext.execute(batchDeleteRequest)
            savedEntities = []
            print("All data deleted successfully.")
        } catch let error {
            print("Failed to delete all data: \(error.localizedDescription)")
        }
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
        waste.createDate = Date()
        saveData()
        userDefaults.increaseNumber(value: count)
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
    func deleteWaste(waste: WasteEntity) {
        container.viewContext.delete(waste)
        userDefaults.decreaseNumber(value: waste.count)
        saveData()
    }
    func editWaste(waste:WasteEntity, count:Double, category:String, note:String){
        waste.count = count
        waste.category = category
        waste.note = note
        saveData()
        
    }
    
}

