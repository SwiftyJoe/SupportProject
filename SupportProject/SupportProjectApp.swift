

import SwiftUI


@main
struct CoreTeamApp: App {
    
    ///Observed Properties
    @State private var dataController = DataController()
    @State var teamController = TeamController()
    @State var playerController = PlayerController()
    
    var body: some Scene {
        WindowGroup {

                TabView{
                    TeamAndPlayerView(teamController: teamController, playerController: playerController)
                        .tabItem{
                            Label{

                                Text("\(teamController.selectedTeam?.wrappedName ?? "NONE SELECTED")")
                                
                            } icon: {
                                Image(systemName: "person.3.fill")
                                
                            }
                            

                        }
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)
            

        }
        
    }
}
