//
//  PlayerController.swift



import CoreData
import Foundation
import PhotosUI

@Observable
class PlayerController {
    var selectedPlayer: Player?
    
    var firstName = ""
    var lastName = ""
    var isAvailable = true

    
    /// A function to reset all properties from teamController to default
    /// - Parameter none:
    func resetProperties(){
        firstName = ""
        lastName = ""
        isAvailable = true

    }
    
    /// A function to save a team (create or update)
    /// - Parameter moc: The Model Context where to store the team
    func savePlayer(to selectedTeam: Team, in_Context moc: NSManagedObjectContext){
        
        if let selectedPlayer  {
            // save changes to existing player
            selectedPlayer.firstName = firstName
            selectedPlayer.lastName = lastName
            selectedPlayer.isAvailable = isAvailable

            
        } else {
            //create new player
            let newPlayer = Player(context: moc)
            newPlayer.id = UUID()
            newPlayer.firstName = firstName
            newPlayer.lastName = lastName
            newPlayer.isAvailable = isAvailable
            
            selectedTeam.addToPlayer(newPlayer)
            
        }
        
        
        // Save to moc
        do {
            try moc.save()
        } catch {
            print("Error creating creating or updating team: \(error)")
        }
        
        resetProperties()
        
    }
    
}

