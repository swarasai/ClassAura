//
//  TextAnalysisView.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

import SwiftUI

struct TextAnalysisView: View {
    @State private var inputText: String = ""
    @State private var analysisResult: String = ""

    var body: some View {
        VStack {
            Text("Paste Text for Analysis")
                .font(.largeTitle)
                .padding()

            // TextEditor for user input
            TextEditor(text: $inputText)
                .frame(height: 200)
                .border(Color.gray)
                .padding()

            Button(action: {
                processTextWithBERT()
            }) {
                Text("Analyze Text")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Display analysis result
            if !analysisResult.isEmpty {
                Text("Analysis Result:")
                    .font(.headline)
                    .padding()

                Text(analysisResult)
                    .padding()
            }
        }
        .padding()
    }

    func processTextWithBERT() {
        // Call the BERTSQUADFP16.mlmodel for text processing
        guard let model = try? BERTSQUADFP16(configuration: MLModelConfiguration()) else {
            analysisResult = "Model could not be loaded."
            return
        }

        // Assuming the model requires input in a specific format
        let bertInput = BERTSQUADFP16Input(input_ids: inputText)  // adjust as needed for model's input type

        if let prediction = try? model.prediction(input: bertInput) {
            analysisResult = prediction.answer  // adjust based on model's output
        } else {
            analysisResult = "Failed to analyze text."
        }
    }
}
