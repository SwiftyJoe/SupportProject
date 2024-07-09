//
//  FilteredPlayerListView.swift
//

import CoreData
import SwiftUI

struct FilteredPlayerListView: View {

    var filteredPlayers: FetchedResults<Player>
    
    var body: some View {
        
            ForEach(filteredPlayers, id: \.id) { player in
                NavigationLink(value: player){
                    PlayerRowView(selectedPlayer: player)
                }

        }
        
    }

    
}


