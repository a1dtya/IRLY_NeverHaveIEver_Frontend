import SwiftUI

struct MessageView: View {
    @State private var isOptionsVisible = false // State variable to control visibility of OptionsView
    @State private var isHomePageVisible = false // State variable to control visibility of HomePageView
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Button(action: {
                        // Navigate to HomePageView
                        self.isHomePageVisible = true
                    }) {
                        Image("Back")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing) //  padding to the left
                    }

                    Image("MatchPfp")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Madison")
                            .font(.headline)
                        Text("Online")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Options(displayBackButton: .constant(true)), isActive: $isOptionsVisible) {
                        EmptyView()
                    }
                    Button(action: {
                        self.isOptionsVisible = true // Show Options
                    }) {
                        Image("Options")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                    }
                }
                .padding(.horizontal) //  horizontal padding for spacing between the edges
                
                Divider()
                    .background(Color.black)
                    .background(Color.white)
                
                Spacer()
                
                // Footer
                Text("     You can only reply if we match first!                                \t")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.701))
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.horizontal)
                    .offset(y: -10)
            }
            .background(Color.white)
            .navigationBarHidden(true)
        }
        .background(
            // NavigationLink to HomePageView
            NavigationLink(destination: HomePageView(), isActive: $isHomePageVisible) {
                EmptyView()
            }
            .hidden() 
        )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
