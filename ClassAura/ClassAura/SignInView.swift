//
//  SignInView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//
import SwiftUI

struct SignInView: View {
    @State private var role: String = ""
    @State private var navigateToNextScreen = false

    var body: some View {
        VStack {
            Text("Sign In as")
                .font(.largeTitle)
            Button("Teacher") {
                role = "Teacher"
                navigateToNextScreen = true
            }
            .padding()
            Button("Student") {
                role = "Student"
                navigateToNextScreen = true
            }
            .padding()
            NavigationLink(destination: role == "Teacher" ? AnyView(TeacherView()) : AnyView(StudentView()), isActive: $navigateToNextScreen) {
                EmptyView()
            }
        }
    }
}
