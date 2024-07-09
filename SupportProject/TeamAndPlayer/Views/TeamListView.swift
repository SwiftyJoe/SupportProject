//
//  TeamListView.swift
//

import SwiftUI

struct TeamListView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var teams: FetchedResults<Team>
    
    
    ///Observed Properties
    @Bindable var teamController: TeamController
    var playerController: PlayerController

    @State private var showAddTeam = false
    
    var body: some View {
        List(selection: $teamController.selectedTeam) {
            ForEach(teams, id: \.id) {team in
                NavigationLink(value: team){
                    TeamRowView(teamController: teamController, team: team)
                    
                }
            }
        }

        .navigationTitle("^[\(teams.count) Team](inflect: true)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            
            Button{
                teamController.selectedTeam = nil
                showAddTeam.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
            }

            
        }
        .sheet(isPresented: $showAddTeam) {
            TeamAddEditView(teamController: teamController)
        }
        .onChange(of: teamController.selectedTeam) {
            playerController.selectedPlayer = nil
        }
    }

}
