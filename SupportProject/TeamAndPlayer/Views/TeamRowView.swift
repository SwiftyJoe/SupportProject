//
//  TeamRowView.swift
//

import SwiftUI

struct TeamRowView: View {
    
    ///Observed Properties
    var teamController: TeamController
    
    var team: Team
    
    @State private var showEditTeam = false
    
    var body: some View {
        
        HStack{
            
            Text(team.wrappedName)
            
            Spacer()
            
            Image(systemName: "info.circle")
                .onTapGesture {
                    teamController.selectedTeam = team
                    showEditTeam.toggle()
                }
                .sheet(isPresented: $showEditTeam) {
                    TeamAddEditView(teamController: teamController)
                }
            
        }
        
    }
}

