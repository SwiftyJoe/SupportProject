//
//  TeamAddEditView.swift


import SwiftUI

struct TeamAddEditView: View {
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.dismiss) var dismiss
    
    ///Observed Properties
    @ObservedObject var teamController: TeamController
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Team Name")){
                    TextField("Team Name", text: $teamController.teamName)
                        .autocorrectionDisabled()
                }
                
            }
            .onAppear {


                if teamController.selectedTeam != nil {
                    teamController.teamName = teamController.selectedTeam!.wrappedName
                }
            }
            .navigationTitle(teamController.selectedTeam == nil ? "Add new Team" :  "Edit  \(teamController.selectedTeam!.wrappedName)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel", role: .cancel) {
                        teamController.resetProperties()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(teamController.selectedTeam == nil ? "Add" :  "Save") {
                            teamController.saveTeam(in_Context: moc)
                            dismiss()
                    }
                    .disabled(teamController.teamName.isEmpty)
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
}

