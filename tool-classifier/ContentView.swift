//
//  ContentView.swift
//  tool-classifier
//
//  Created by MITC-MAC-TWO on 2023-11-01.
//

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    @State private var image: Image?
    @State private var classificationResult: String = "Select an image"
    private let model = ToolClassifier_1(model: <#T##MLModel#>);
    
    var body: some View {
        VStack {
            Text(classificationResult)
            
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Button("Select Image") {
                self.classificationResult = "Classifying..."
                self.image = nil
                // Present an image picker or load an image from your data source
            }
        }
    }
    
    func classifyImage(uiImage: Image) -> VNCoreMLModel {
        let defaultConfig = MLModelConfiguration()


        // Create an instance of the image classifier's wrapper class.
        let imageClassifierWrapper = try? ToolClassifier_1(configuration: defaultConfig)


        guard let imageClassifier = imageClassifierWrapper else {
            fatalError("App failed to create an image classifier model instance.")
        }


        // Get the underlying model instance.
        let imageClassifierModel = imageClassifier.model


        // Create a Vision instance using the image classifier's model instance.
        guard let imageClassifierVisionModel = try? VNCoreMLModel(for: imageClassifierModel) else {
            fatalError("App failed to create a `VNCoreMLModel` instance.")
        }


        return imageClassifierVisionModel;
    }
}
