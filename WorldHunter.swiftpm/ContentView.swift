import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 300,height: 300)

                Text("World Hunter")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)

                NavigationLink {
                    CategoryView()
                } label: {
                    Image("btnStart")
                }
            }
        }   .navigationViewStyle(StackNavigationViewStyle())


       
        
    }
}

