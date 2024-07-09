//
//  TeamAndPlayerView.swift
//  CoreTeam
//

import SwiftUI

struct TeamAndPlayerView: View {
    
    ///Observed Properties
    var teamController: TeamController
    var playerController: PlayerController
    
    @State private var visibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            TeamListView(teamController: teamController,  playerController: playerController)

        } content: {
            PlayerListView(teamController: teamController, playerController: playerController)
            
        } detail: {
            if playerController.selectedPlayer != nil {
                PlayerDetailView(teamController: teamController, playerController: playerController, selectedPlayer: playerController.selectedPlayer!)
            } else {
                ContentUnavailableView("No Player", systemImage: "person.fill", description: Text("Please add or select a player to see the details."))
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}
