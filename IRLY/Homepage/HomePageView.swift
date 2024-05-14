import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            // Background color for the entire view
            Color.white
            
            
            ScrollView(showsIndicators: false) {

            VStack {
                // Main Content Screen
                VStack {
                    Image("HomePage01")
                        .resizable()
                        .padding()
                        .frame(width: 380, height: 320)
                        .padding(.top, -69)
                        .shadow(radius: 5)// Add negative padding to move the image above the top safe zone
                    
                    NeverBox()
                        .frame(width: 350, height: 650)
                        .padding(.top, -200)
                        .shadow(radius: 5)
                    
                    Image("HomePage02")
                        .resizable()
                        .padding(.all)
                        .frame(width: 370, height: 300)
                        .padding(.top, -190)
                        .shadow(radius: 5)
                }
                // Added padding to move content below the header
            }
            .edgesIgnoringSafeArea(.all) // Ignored the safe area insets
        }
            //  to add FooterView at the bottom left corner
            VStack {
                Spacer()
                HStack {
                    Spacer() // Add Spacer to push the FooterView to the right
                    FooterView()
                        .padding(.trailing, 320)
                        .shadow(radius: 5)// Add padding to move the FooterView slightly to the right
                }
            }
            
            // HeaderView
            HeaderView()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.9), Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, -400)
                .padding(.horizontal, 0)
            
        }
    }
    
   
        
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
