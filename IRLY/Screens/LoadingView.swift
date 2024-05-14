import SwiftUI
 
struct LoadingView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack {
            // Purple-colored background
            Rectangle()
                .foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Image in the center with specified dimensions
                Image("IRLY")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70) // Adjust width and height as needed
                    .padding()
                
                // Custom circular progress indicator below the image
                Circle()
                    .trim(from: 0.0, to: 1.0)
                    .stroke(Color.white, lineWidth: 4)
                    .frame(width: 20, height: 20) // Adjust width and height as needed
                    .rotationEffect(.degrees(-90))
                    .padding()
            }
        }
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
