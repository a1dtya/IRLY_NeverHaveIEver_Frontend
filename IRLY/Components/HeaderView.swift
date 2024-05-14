import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isMessageViewPresented = false
    
    var body: some View {
        ZStack {
            HStack {
                // Left image
                Button(action: {
                    
                }) {
                    Image("MatchPfp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90) // Adjust size as needed
                        .padding(.leading)
                }
                
                Spacer()
                
                // Center image
                Button(action: {
                    
                }) {
                    Image("IRLY")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70) // Adjust size as needed
                }
                
                Spacer()
                
                // Right image
                Button(action: {
                    // to Navigate to MessageView
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
