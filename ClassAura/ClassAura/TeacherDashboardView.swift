//
//  TeacherDashboardView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct TeacherDashboardView: View {
    @State private var responses: [StudentResponse] = [] // This will be populated with data from the backend
    
    var body: some View {
        List(responses) { response in
            VStack(alignment: .leading) {
                Text("Student Reflection: \(response.dailyReflection)")
                Text("Mood: \(response.mood)")
            }
        }
        .onAppear {
            fetchResponses()
        }
    }
    
    func fetchResponses() {
        // Fetch student responses for the active code from the backend
    }
}

struct StudentResponse: Identifiable {
    var id: String
    var mood: String
    var dailyReflection: String
}
