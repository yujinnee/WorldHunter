import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 300,height: 300)

                Text("World Hunter")
                    .font(.largeTitle)

                NavigationLink {
                    CategoryView()
                } label: {
                    Label("Let's start", systemImage: "chevron.right.circle")
                }
            }
        }   .navigationViewStyle(StackNavigationViewStyle())

//            ARView().frame(width: 500, height: 500)

       
        
    }
}

