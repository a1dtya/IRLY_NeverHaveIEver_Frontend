import SwiftUI

struct Options: View {
    @Binding var displayBackButton: Bool //  binding for back button display
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            OptionButton(title: "About")
            Divider()
            OptionButton(title: "Info")
            Divider()
            OptionButton(title: "Report", isHighlighted: true) // Make Report option red
            Divider()
        }
        .padding()
        
    }
}

struct OptionButton: View {
    let title: String
    let isHighlighted: Bool
    
    init(title: String, isHighlighted: Bool = false) {
        self.title = title
        self.isHighlighted = isHighlighted
    }
    
    var body: some View {
        HStack {
            Spacer() // to center Align test
            Text(title)
                .foregroundColor(isHighlighted ? .red : .black) // this is to Highlight text
                .padding()
                .frame(maxWidth: .infinity, alignment: .center) // aligning text
            Spacer()
        }
    }
}

#if DEBUG
struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options(displayBackButton: .constant(true)) // Set initial value for displayBackButton
    }
}
#endif
