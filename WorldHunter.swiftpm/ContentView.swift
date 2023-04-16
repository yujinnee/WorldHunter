import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("World Hunter")
                    
                NavigationLink {
                    CategoryView()
                } label: {
                    Label("Let's start", systemImage: "chevron.right.circle")
                }
            }
        }   .navigationViewStyle(StackNavigationViewStyle())
        
    }
}
