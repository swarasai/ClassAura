//
//  StudentView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct StudentView: View {
    @ObservedObject var viewModel = StudentViewModel()

    var body: some View {
        VStack {
            if !viewModel.showClassroom {
                TextField("Enter 6-Digit Code", text: $viewModel.inputCode)
                    .keyboardType(.numberPad)
                    .padding()
                Button("Enter Class") {
                    viewModel.validateCode()
                }
            } else {
                TextField("How was your day?", text: $viewModel.dailyReflection)
                    .padding()
                TextField("How do you feel?", text: $viewModel.mood)
                    .padding()
                Button("Submit") {
                    viewModel.submitResponse()
                }
            }
        }
    }
}
