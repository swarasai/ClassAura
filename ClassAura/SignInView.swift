import SwiftUI

struct SignInView: View {
    @State private var role: String = ""
    @State private var navigateToNextScreen = false

    var body: some View {
        VStack {
            Text("Sign In as")
                .font(.largeTitle)
                .padding()

            // Pink Teacher Button
            Button(action: {
                role = "Teacher"
                navigateToNextScreen = true
            }) {
                Text("Teacher")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            // Pink Student Button
            Button(action: {
                role = "Student"
                navigateToNextScreen = true
            }) {
                Text("Student")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            // NavigationLink that triggers based on role and navigation flag
            NavigationLink(
                destination: role == "Teacher" ? AnyView(TeacherView()) : AnyView(StudentView()),
                isActive: $navigateToNextScreen
            ) {
                EmptyView()
            }
        }
        .navigationBarHidden(true)  // Hide the navigation bar if necessary
    }
}
