//
//  Persistence.swift
//  ProRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    //static let instance = PersistenceController()
    // let container: NSPersistentContainer
    // let context: NSManagedObjectContext

//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = CDProject(context: viewContext)
//            newItem.timestamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ProRecorder")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    // ---------------------------------------------------------------------------------------------- //
    
    //FUNCTIONS
    
    func addCDProject(projectname: String) {
        let newProject = CDProject(context: container.viewContext)
        newProject.timestamp = Date()
        newProject.projectName = projectname
        saveData()
    }
    
    func deleteCDProject(_ project: CDProject) {
        container.viewContext.delete(project)
        saveData()
    }
    
    func toggleCDRecording(project: CDProject) {
        project.isRecording.toggle()
        saveData()
    }
    
    func addCDRecording(projectname: String, recordingDescription: String, recordingDuration: Int) {
        let newRecording = CDRecordings(context: container.viewContext)
        newRecording.project = projectname
        newRecording.recordingDescription = recordingDescription
        newRecording.recordingDuration = Int64(recordingDuration)
        newRecording.date = Date()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            print("Saved succesfully!")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
}
