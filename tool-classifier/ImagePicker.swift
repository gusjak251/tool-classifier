//
//  ImagePicker.swift
//  tool-classifier
//
//  Created by MITC on 2023-11-09.
//

import Foundation
import UIKit
import SwiftUI
import CoreML
import Vision

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing:Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var parent:ImagePicker
    
    init(_ picker:ImagePicker){
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            DispatchQueue.main.async {
                self.parent.selectedImage = image
                classifyImage(image)
            }
        }
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        
        parent.isPickerShowing = false
    }
    
}

func classifyImage(UIImage: Image) -> VNCoreMLModel {
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
