//
//  PlayerListView.swift
//

import SwiftUI

struct PlayerListView: View {
    
    @FetchRequest(sortDescriptors: []) var players: FetchedResults<Player>
    
    
    ///Observed Properties
    var teamController: TeamController
    @Bindable var playerController: PlayerController

    
    @State private var showAddPlayer = false

    

    var body: some View {
        if teamController.selectedTeam != nil {
            List(selection: $playerController.selectedPlayer){
                FilteredPlayerListView(filteredPlayers: players)
            }
            .listStyle(SidebarListStyle())
            
            .navigationTitle("\(teamController.selectedTeam!.wrappedName) - (^[\(teamController.selectedTeam!.playerArray.count) Player](inflect: true))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
   
                ToolbarItem{
                    Button{
                        playerController.selectedPlayer = nil
                        showAddPlayer = true
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    
                    .sheet(isPresented: $showAddPlayer) {
                        PlayerAddEditView(teamController: teamController, playerController: playerController)
                    }
                }
            }
            
        } else {
            ContentUnavailableView("No Team", systemImage: "person.3.fill", description: Text("Please add or select a team."))
        }
    }
    
  
}

