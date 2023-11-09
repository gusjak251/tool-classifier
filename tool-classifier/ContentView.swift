//
//  ContentView.swift
//  tool-classifier
//
//  Created by MITC-MAC-TWO on 2023-11-01.
//

import SwiftUI
import CoreML
import Vision
import UIKit

struct ContentView: View {
    
    ///@State private var image: Image?
    
    @State var selectedImage:UIImage?
    @State var isPickerShowing = false
    
    ///@State private var classificationResult: String = "Select an image"
    
    
    ///private let model = ToolClassifier_1(model: MLModel());
   /// var imagepicker = UIImagePickerController()
    var body: some View {
        
        VStack {
           ///Text(classificationResult)
            
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200,height: 200)
            }
            
           /// image?
             ///   .resizable()
             ///   .aspectRatio(contentMode: .fit)
              ///  .frame(width: 200, height: 200)
            
      ///      Button("Select Image", action: buttonTapped) {
                //self.classificationResult = "Classifying..."
                //self.image = nil
                // Present an image picker or load an image from your data source
      ///          isPickerShowing=true
                
            Button{
                isPickerShowing=true
            } label: {
                Text("Select Image")
            }
            
            }
            .sheet(isPresented:$isPickerShowing,onDismiss: nil){
                ImagePicker(selectedImage: $selectedImage,isPickerShowing: $isPickerShowing)
            }
            
        }
    }
    
   /// func buttonTapped() {
   ///     self.classificationResult = "Test function";
        
    ///    if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
      ///      imagepicker.delegate = self
      ///      imagepicker.sourceType = .savedPhotosAlbum
            
     ///   }
        
 ///   }
    

struct ContentView_Previews:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
    
    
    /*func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            button.imageView.contentMode = .ScaleAspectFit
            button.imageView.image = pickedImage
        }

        dismissViewControllerAnimated(true, completion: nil)
    }*/

