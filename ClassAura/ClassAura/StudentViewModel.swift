//
//  StudentViewModel.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import Foundation

import Firebase

class StudentViewModel: ObservableObject {
    @Published var inputCode: String = ""
    @Published var mood: String = ""
    @Published var dailyReflection: String = ""
    @Published var showClassroom = false
    
    func validateCode() {
        let db = Firestore.firestore()
        db.collection("codes").document(inputCode).getDocument { (document, error) in
            if let document = document, document.exists {
                self.showClassroom = true
            } else {
                print("Invalid code")
            }
        }
    }
    
    func submitResponse() {
        let db = Firestore.firestore()
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
