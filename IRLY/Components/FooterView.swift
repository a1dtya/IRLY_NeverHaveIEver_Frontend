import SwiftUI

struct FooterView: View {
    @State private var isButtonTapped = false
    
    var body: some View {
        Button(action: {
            // Perform the  action when tapped
            isButtonTapped.toggle()
        }) {
            Image("LeftSwipe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
        }
        .foregroundColor(.blue)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
