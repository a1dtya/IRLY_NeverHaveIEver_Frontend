import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isMessageViewPresented = false
    
    var body: some View {
        ZStack {
            HStack {
                // Left image (img1)
                Button(action: {
                    // Add action for the left image (img1)
                    // Navigate or perform any action you want here
                }) {
                    Image("MatchPfp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90) // Adjust size as needed
                        .padding(.leading)
                }
                
                Spacer()
                
                // Center image (img2)
                Button(action: {
                    
                }) {
                    Image("IRLY")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70) // Adjust size as needed
                }
                
                Spacer()
                
                // Right image (img3)
                Button(action: {
                    // Navigate to MessageView
                    isMessageViewPresented = true
                }) {
                    Image("Chat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80) // Adjust size as needed
                        .padding(.trailing)
                }
            }
            .padding()
        }
        .sheet(isPresented: $isMessageViewPresented) {
            MessageView()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
