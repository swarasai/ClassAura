//
//  ClassCodeEntryView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct ClassCodeEntryView: View {
    @State private var classCode: String = ""
    @State private var errorMessage: String = ""
    @State private var isCodeValid = false

    var body: some View {
        VStack {
            Text("Enter Class Code")
                .font(.largeTitle)
                .padding()

            TextField("6-digit Class Code", text: $classCode)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 300)

            // Display error message if any
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                validateClassCode()
            }) {
                Text("Submit")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // If class code is valid, navigate to the reflection input view
            if isCodeValid {
                NavigationLink(destination: StudentResponseView(classCode: classCode)) {
                    Text("Proceed to Class")
                }
                .padding()
            }
        }
    }

    // Function to validate the class code
    func validateClassCode() {
        // Assuming we check Firebase for valid class code
        let db = Firestore.firestore()
        db.collection("Classes").document(classCode).getDocument { document, error in
            if let document = document, document.exists {
                isCodeValid = true
                errorMessage = ""
            } else {
                errorMessage = "Invalid class code. Please try again."
                isCodeValid = false
            }
        }
    }
}
