import FirebaseFirestore

class TeacherViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var isCodeUsed = false

    private let db = Firestore.firestore()

    func generateCode() {
        code = String(format: "%06d", Int.random(in: 0...999999))  // Generate random 6-digit code
    }

    func useCode() {
        storeCodeInDatabase(code: code)
        isCodeUsed = true
    }

    private func storeCodeInDatabase(code: String) {
        db.collection("codes").document(code).setData(["teacherID": "teacher123"]) { error in
            if let error = error {
                print("Error storing code: \(error)")
            }
        }
    }
}
