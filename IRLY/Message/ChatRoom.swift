
import SwiftUI

struct ChatRoomView: View {
    @Binding var userSelections: [String]
    @Binding var correctAnswers: [String]
    @Binding var matchPercentage: Int
    @State private var showingHomePage = false
    @State private var displayOptions = false // Track if Options view should be displayed
    private let questions = [
        "I went skinny dipping",
        "Tried eating ice cream with a fork",
        "Attempted DIY home"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    NavigationLink(destination: HomePageView()
                        .navigationBarBackButtonHidden(self.showingHomePage) // Hide back button when showingHomePage is true
                        .onAppear {
                            // Set showingHomePage to true when navigating to HomePageView
                            self.showingHomePage = true
                        }
                    ) {
                        Image("Back")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                            .navigationBarBackButtonHidden(true)
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
                    
                    NavigationLink(destination: Options(displayBackButton: .constant(true)), isActive: $displayOptions) {
                        EmptyView()
                    }
                    Button(action: {
                        self.displayOptions = true // Show Options view when the button is tapped
                    }) {
                        Image("Options")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .background(Color.black)
                    .background(Color.white)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        VStack {
                            Image("NeverHaveIEver")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 280, height: 110)
                                .padding(-5)
                            
                            ScrollView {
                                VStack(spacing: 0) {
                                    ForEach(userSelections.indices, id: \.self) { index in
                                        VStack {
                                            HStack {
                                                Text(matchStatusEmoji(at: index))
                                                    .font(.headline)
                                                Text("\(questions[index]):")
                                                    .font(.headline)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                            Divider()
                                        }
                                        .padding(.vertical, 1)
                                    }
                                }
                                .padding(.bottom)
                            }
                            .frame(width: 230, height: 100)
                            
                            VStack {
                                Text("   Your Match Score   ")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                Text("✨\(matchPercentage)✨")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255).opacity(0.3)))
                            .frame(width: 200, height: 70)
                            .padding(.bottom, 5)
                        }
                        .frame(width: 250, height: 300)
                        .background(Color.white)
                        .border(Color.black, width: 2)
                        .cornerRadius(5)
                        
                        VStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 180, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 2)
                                )
                                .padding(.bottom)
                                .overlay(
                                    HStack {
                                        TextField("What do you think?", text: .constant(""))
                                            .padding([.leading, .bottom, .trailing], 15.6)
                                    }
                                )
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 1)
                        .padding(.trailing, -10.0)
                    }
                }
                .padding(.trailing)
                
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
        }
    }
    
    private func matchStatusEmoji(at index: Int) -> String {
        let userSelection = userSelections[index]
        let correctAnswer = correctAnswers[index]
        return userSelection == correctAnswer ? "🤝🏼" : "💀"
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(userSelections: .constant([]), correctAnswers: .constant([]), matchPercentage: .constant(66))
    }
}
