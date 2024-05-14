import SwiftUI

struct ListView: View {
    @Binding var userSelections: [String]
    @Binding var correctAnswers: [String]
    @Binding var matchPercentage: Int
    
    @State private var isChatRoomVisible = false
    @State private var isHomePageVisible = false
    
    private let questions = [
        "I went skinny dipping",
        "Tried eating ice cream with a fork",
        "Attempted DIY home"
    ]
    
    init(userSelections: Binding<[String]>, correctAnswers: Binding<[String]>, matchPercentage: Binding<Int>) {
        self._userSelections = userSelections
        self._correctAnswers = correctAnswers
        self._matchPercentage = matchPercentage
    }
    
    var body: some View {
        ZStack {
            
            
            
            
            NavigationView {
                VStack {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                // to Navigate to HomePageView
                                isHomePageVisible = true
                            }) {
                                Image("cross")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                        }
                        Image("MatchImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 140)
                            .padding(.top)
                        
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(userSelections.indices, id: \.self) { index in
                                    VStack {
                                        HStack {
                                            Text(matchStatusEmoji(at: index))
                                                .font(.headline)
                                            Text(" \(questions[index])")
                                                .font(.headline)
                                                .foregroundColor(Color(UIColor.lightGray))
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        Divider()
                                    }
                                    .padding(.vertical, 5)
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        .frame(height: 200)
                        
                        VStack {
                            Text("   Your Match Score   ")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("✨\(matchPercentage)✨") //Match percentage score
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255).opacity(0.3)))
                        .frame(width: 300)
                        .padding(.bottom, 20)
                        
                        VStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 70)
                                        .stroke(Color.gray, lineWidth: 2)
                                )
                                .padding(.horizontal)
                                .padding(.bottom,5)
                                .overlay(
                                    HStack {
                                        
                                        
                                        
                                         
                                         Button(action: {
                                             // to avigate to HomePageView
                                           
                                         }) {
                                             Image("Dice")
                                                .resizable()
                                                .frame(width: 25, height: 35)
                                                .padding(.horizontal, 25)
                                               // .padding(.vertical,-22)
                                            
                                         }
                                        
                                        TextField("Chat here", text: .constant(""))
                                            .padding(.horizontal, -20)
                                            .padding(.vertical,0)
                                        Button(action: {
                                            // to Navigate to ChatRoomView
                                            withAnimation {
                                                isChatRoomVisible = true
                                            }
                                        }) {
                                            Image("SendMessage")
                                                .resizable()
                                                .frame(width: 33, height: 33)
                                                .padding(.horizontal,25)
                                                //.padding(.vertical,-23)
                                        }
                                    }
                                        
                                )
                                .cornerRadius(10)
                        }
                        .padding(.horizontal,10)
                        .padding(.bottom)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .frame(width: 300)
                    .padding(.bottom, 20)
                }
                .padding()
                .navigationBarHidden(true)
            }
            
            if isHomePageVisible {
                HomePageView()
                    .transition(.move(edge: .top))
            }
            
            if isChatRoomVisible {
                ChatRoomView(userSelections: $userSelections, correctAnswers: $correctAnswers, matchPercentage: $matchPercentage)
                    .transition(.move(edge: .trailing)) 
            }
        }
    }
    
    private func matchStatusEmoji(at index: Int) -> String {
        let userSelection = userSelections[index]
        let correctAnswer = correctAnswers[index]
        return userSelection == correctAnswer ? "🤝🏼" : "💀"
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(userSelections: .constant([]), correctAnswers: .constant([]), matchPercentage: .constant(66))
    }
}
