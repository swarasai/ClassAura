//
//  TeacherViewModel.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import Foundation
import Firebase


class TeacherViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var isCodeUsed = false
    
    func generateCode() {
        code = String(format: "%06d", Int.random(in: 0...999999))
    }
    
    func useCode() {
        storeCodeInDatabase(code: code)
        isCodeUsed = true
    }
    
    private func storeCodeInDatabase(code: String) {
        let db = Firestore.firestore()
        db.collection("codes").document(code).setData(["teacherID": "teacher123"]) { error in
            if let error = error {
                print("Error storing code: \(error)")
            }
        }
    }
}
