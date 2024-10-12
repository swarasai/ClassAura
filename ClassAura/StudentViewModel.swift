import FirebaseFirestore

class StudentViewModel: ObservableObject {
    @Published var inputCode: String = ""
    @Published var mood: String = ""
    @Published var dailyReflection: String = ""
    @Published var showClassroom = false

    private let db = Firestore.firestore()

    func validateCode() {
        db.collection("codes").document(inputCode).getDocument { (document, error) in
            if let document = document, document.exists {
                self.showClassroom = true
            } else {
                print("Invalid code or error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    func submitResponse() {
        guard !inputCode.isEmpty else { return }  // Ensure inputCode is available
        
        db.collection("responses").document(inputCode).collection("studentResponses").addDocument(data: [
            "mood": mood,
            "dailyReflection": dailyReflection
        ]) { error in
            if let error = error {
                print("Error submitting response: \(error)")
            }
        }
    }
}
