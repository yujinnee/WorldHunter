import SwiftUI

@main
struct MyApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
    
}
