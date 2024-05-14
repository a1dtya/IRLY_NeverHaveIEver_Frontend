import SwiftUI

struct FooterView: View {
    @State private var isButtonTapped = false
    
    var body: some View {
        Button(action: {
            // Perform the desired action when the button is tapped
            isButtonTapped.toggle()
        }) {
            Image("LeftSwipe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100) // Adjust height as needed
        }
        .foregroundColor(.blue) // Change button color if needed
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
