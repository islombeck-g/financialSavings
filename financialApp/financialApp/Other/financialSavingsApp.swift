

import SwiftUI

@main
struct financialSavingsApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
