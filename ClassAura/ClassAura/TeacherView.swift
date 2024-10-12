//
//  TeacherView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct TeacherView: View {
    @ObservedObject var viewModel = TeacherViewModel() // Using ViewModel to handle logic

    var body: some View {
        VStack {
            if !viewModel.isCodeUsed {
                Button("Generate 6-Digit Code") {
                    viewModel.generateCode()
                }
                Text("Your Code: \(viewModel.code)")
                Button("Use This Code") {
                    viewModel.useCode()
                }
            } else {
                Text("Code is Active: \(viewModel.code)")
                Button("View Dashboard") {
                    // Navigate to the teacher's dashboard
                    NavigationLink(destination: TeacherDashboardView()) {
                        Text("Go to Dashboard")
                    }
                }
            }
        }
    }
}
