import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            LoadingView(isLoading: $isLoading)
                .onAppear {
                   
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isLoading = false
                    }
                }
        } else {
            NavigationView {
                HomePageView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
