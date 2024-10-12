import SwiftUI

struct StudentView: View {
    @State private var navigateToClassCode = false
    @State private var navigateToTextAnalysis = false

    var body: some View {
        VStack {
            Text("Student Options")
                .font(.largeTitle)
                .padding()

            NavigationLink(destination: ClassCodeEntryView(), isActive: $navigateToClassCode) {
                Button(action: {
                    navigateToClassCode = true
                }) {
                    Text("Enter Class Code")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()

            NavigationLink(destination: TextAnalysisView(), isActive: $navigateToTextAnalysis) {
                Button(action: {
                    navigateToTextAnalysis = true
                }) {
                    Text("Paste Text for Analysis")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
