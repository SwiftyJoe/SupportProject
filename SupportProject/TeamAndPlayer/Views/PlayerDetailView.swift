//
//  PlayerDetailView.swift


import SwiftUI

struct PlayerDetailView: View {
    @Environment(\.managedObjectContext) var moc
    
    ///Observed Properties
    var teamController: TeamController
    @Bindable var playerController: PlayerController
    @ObservedObject var selectedPlayer: Player

    @State private var showEditPlayerSheet = false

    
    var body: some View {
 
        if let player = playerController.selectedPlayer{
            
            Form{
                                        
                    VStack(alignment: .center){

                        
                        Text("\(selectedPlayer.wrappedFirstName) \(selectedPlayer.wrappedLastName)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        //Toggle("Toggle", isOn: $selectedPlayer.isAvailable)
                        Toggle("Available for Match?", isOn: $selectedPlayer.isAvailable)
                                                .onChange(of: selectedPlayer.isAvailable) {
                                                    try? moc.save()
                                                            }
                        
                    }
            }
            .navigationTitle("\(player.wrappedFirstName) \(player.wrappedLastName)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup() {
                    
                    Button("Edit"){
                        showEditPlayerSheet.toggle()
                    }
                    .sheet(isPresented: $showEditPlayerSheet) {
                        PlayerAddEditView(teamController: teamController, playerController: playerController)
                    }
                    
                }
            }
        }
    }
}


