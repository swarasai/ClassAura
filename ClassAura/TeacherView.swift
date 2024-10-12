import SwiftUI

struct TeacherView: View {
    @ObservedObject var viewModel = TeacherViewModel()

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
                NavigationLink(destination: TeacherDashboardView()) {
                    Text("Go to Dashboard")
                }
            }
        }
    }
}
