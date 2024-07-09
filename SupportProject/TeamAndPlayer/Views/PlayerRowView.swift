//
//  PlayerRowView.swift


import SwiftUI

struct PlayerRowView: View {
    
    var selectedPlayer: Player
    
    var body: some View {
            HStack{
                Text("\(selectedPlayer.wrappedLastName) \(selectedPlayer.wrappedFirstName)")
            Image(systemName: selectedPlayer.isAvailable ? "checkmark" : "x.circle")
            }
    }

}
