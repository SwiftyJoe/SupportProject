//
//  DataController.swift


import CoreData
import Foundation

@Observable
class DataController {

    static let shared = DataController()
    
    
    //Erstellung des Containers
    let container = NSPersistentContainer(name: "TeamPlayerData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        /* NSMergePolicy ist erforderlich, damit Team und Player durch CoreData miteinander verbunden werden (Umsetzung der One-To-Many Verknüpfung)*/
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
}
