//
//  PlayerAddEditView.swift


import SwiftUI
import PhotosUI

struct PlayerAddEditView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.dismiss) var dismiss
    
    ///Observed Properties
    var teamController: TeamController
    @Bindable var playerController: PlayerController
    
    @FetchRequest(sortDescriptors: []) var allPlayers: FetchedResults<Player>
    
    var body: some View {
        
        NavigationStack {
            
            Form{
                    TextField("First Name", text: $playerController.firstName)
                    TextField("Last Name", text: $playerController.lastName)
            }
            .navigationTitle(playerController.selectedPlayer == nil ? "Add new Player to \(teamController.selectedTeam!.wrappedName)" : "Update Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel", role: .cancel) {
                        playerController.resetProperties()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(playerController.selectedPlayer == nil ? "Add" :  "Save") {
                        playerController.savePlayer(to: teamController.selectedTeam!, in_Context: moc)
                        dismiss()
                    }

                }
            }
            //Set default FocusState
            .onAppear{

                if let player = playerController.selectedPlayer {
                    
                    playerController.firstName = player.firstName ?? ""
                    playerController.lastName = player.lastName ?? ""

                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
    
}
