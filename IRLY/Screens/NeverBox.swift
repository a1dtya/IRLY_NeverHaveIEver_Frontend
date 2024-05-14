import SwiftUI

struct NeverBox: View {
    @State private var matchStatus: String = "You haven't matched yet"
    @State private var currentQuestionIndex: Int = 0
    @State private var leftButtonImage: String = "YesButton"
    @State private var rightButtonImage: String = "NoButton"
    @State private var isTransitioning: Bool = false
    @State private var buttonPressCount: Int = 0
    @State private var matchPercentage: Int = 0
    @State private var userSelections: [String] = Array(repeating: "", count: 3)
    @State private var correctAnswers: [String] = Array(repeating: "", count: 3)
    
    private let questions = [
        "I went skinny dipping",
        "Tried eating ice cream with a fork",
        "Attempted DIY home"
    ]
    private let options = [
        ["😜", "🫣"], // Options for Question 1
        ["😜", "🫣"], // Options for Question 2
        ["😜", "🫣"] // Options for Question 3
    ]
    private let correctAnswersList = ["🫣", "😜", "🫣"] // Correct answers set by the other person
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 9) {
                Image("NeverHaveIEver")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geometry.size.height * 0.15)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                Text(questions[currentQuestionIndex])
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                HStack(spacing: 10) {
                    ForEach(options[currentQuestionIndex], id: \.self) { option in
                        VStack {
                            Button(action: {
                                if !isTransitioning {
                                    isTransitioning = true
                                    selectOption(option: option)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        isTransitioning = false
                                        leftButtonImage = "YesButton"
                                        rightButtonImage = "NoButton"
                                    }
                                }
                            }) {
                                Image(option == "😜" ? leftButtonImage : rightButtonImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.1)
                                    .animation(.easeInOut(duration: 1))
                            }
                            .disabled(isTransitioning)
                            
                            Text(option == "😜" ? "Yes" : "No")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255))
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.horizontal)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: calculateLineWidth(for: geometry.size.width * 0.5), height: 8)
                        .foregroundColor(questionColor())
                        .opacity(0.5)
                        .cornerRadius(4)
                        .padding(.bottom, 10)
                    
                    Rectangle()
                        .frame(width: calculateBoldWidth(for: geometry.size.width * 0.5), height: 8)
                        .foregroundColor(Color(red: 119/255, green: 66/255, blue: 219/255))
                        .opacity(0.5)
                        .cornerRadius(4)
                        .padding(.bottom, 10)
                }
                
                if matchStatus != "You haven't matched yet" {
                    Text("")
                }
            }
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            .frame(width: geometry.size.width, height: geometry.size.height) // Adjust the frame size here
            .fullScreenCover(isPresented: Binding(
                get: {
                    buttonPressCount.isMultiple(of: 3) && currentQuestionIndex == 2
                },
                set: { _ in }
            ), content: {
                ListView(userSelections: $userSelections, correctAnswers: $correctAnswers, matchPercentage: $matchPercentage)

            })
        }
    }
    
    private func selectOption(option: String) {
        buttonPressCount += 1 // Increment button press count
        
        if currentQuestionIndex >= questions.count {
            matchStatus = "You've answered all questions. No more matches."
            return
        }
        
        userSelections[currentQuestionIndex] = option // Update userSelections
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
            } else {
                matchPercentage = calculatePercentage() // Update match percentage
                matchStatus = matchPercentage >= 50 ? "You have a match!" : "No match this time."
            }
        }
        
        if option == correctAnswersList[currentQuestionIndex] {
            correctAnswers[currentQuestionIndex] = option // Update correctAnswers
            if option == "😜" {
                leftButtonImage = "BothYes"
            } else {
                rightButtonImage = "BothNo"
            }
        } else {
            if option == "😜" {
                leftButtonImage = "UserYes"
                rightButtonImage = "DateNo"
            } else {
                leftButtonImage = "DateYes"
                rightButtonImage = "UserNo"
            }
        }
    }
    
    private func calculateLineWidth(for totalWidth: CGFloat) -> CGFloat {
        return totalWidth * 0.6
    }
    
    private func calculateBoldWidth(for totalWidth: CGFloat) -> CGFloat {
        if currentQuestionIndex >= questions.count {
            return calculateLineWidth(for: totalWidth)
        }
        let progress = CGFloat(currentQuestionIndex + 1) / CGFloat(questions.count)
        return calculateLineWidth(for: totalWidth) * progress
    }
    
    private func questionColor() -> Color {
        switch currentQuestionIndex {
        case 0:
            return .gray
        case 1:
            return .gray
        case 2:
            return .gray
        default:
            return .gray
        }
    }
    
    private func calculatePercentage() -> Int {
        let correctCount = correctAnswers.enumerated().filter { index, answer in
            answer == correctAnswersList[index]
        }.count
        return correctCount * 33 // Update match percentage based on correct count
    }
}

struct NeverBox_Previews: PreviewProvider {
    static var previews: some View {
        NeverBox()
            .frame(width: 350, height: 650)
    }
}
