//
//  TeamController.swift


import CoreData
import Foundation

/// A Controller containing and controlling all relevant elements for the Teams
///  
/// In diesem Controller werden alle Steuervariablen und alle Funktionen zum kontrollieren der Teams vorgehalten und kontrolliert.
@Observable
class TeamController {
    

    var selectedTeam: Team?
    var teamName = ""
    var showDuplicateNameAlert: Bool = false

    
    /// A function to reset all properties from teamController to default
    /// - Parameter none:
    func resetProperties(){
        selectedTeam = nil
        teamName = ""


    }
    
    
    /// A function to save a team (create or update)
    /// - Parameter moc: The Model Context where to store the team
    func saveTeam(in_Context moc: NSManagedObjectContext){
        
        if let selectedTeam  {
            // save changes to existing team
            selectedTeam.name = teamName
            
        } else {
            //create new team
            let newTeam = Team(context: moc)
            newTeam.id = UUID()
            newTeam.name = teamName

        }
        
        // Save to moc
        do {
            try moc.save()
        } catch {
            print("Error creating creating or updating team: \(error)")
        }
        
        resetProperties()
        
    }
    
    
    /// A function to check if the team name already exists
    /// - Parameter moc: The Model Context where to search for a duplicate team name
    /// - Returns: TRUE if team name already exists
    func teamNameIsNotDuplicate(in_Context moc: NSManagedObjectContext) -> Bool {
        
        if let selectedTeam = selectedTeam, teamName == selectedTeam.wrappedName {
            return true
        } else {
            
            // Prüfen, ob der Name bereits existiert
            let fetchRequest: NSFetchRequest<Team> = Team.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", teamName)
            
            do {
                let existingTeamWithSameName = try moc.fetch(fetchRequest)
                return existingTeamWithSameName.isEmpty
            } catch {
                return false
            }
        }
    }

}


