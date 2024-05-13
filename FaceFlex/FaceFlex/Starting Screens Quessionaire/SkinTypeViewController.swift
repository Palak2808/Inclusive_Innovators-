//
//  SkinTypeViewController.swift
//  FaceFlex
//
//  Created by student on 09/05/24.
//

import UIKit

class SkinTypeViewController: UIViewController{
    
    /// Collection of UIImageViews representing different skin types.
    @IBOutlet var skinImage: [UIImageView]!
    /// Variable to track the selected image view.
    var selectedImageView: UIImageView? // Variable to track the selected image view

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               applyCornerRadiusToImageViews()
               for imageView in skinImage {
                   let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
                   imageView.isUserInteractionEnabled = true
                   imageView.addGestureRecognizer(tapGesture)
               }
        
    }
    
    func applyCornerRadiusToImageViews() {
        // Apply corner radius to each UIImageView in the outlet collection
        for imageView in skinImage {
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
        }
    }
    /// Function to check if an image is selected.
    func isImageSelected() -> Bool {
            return selectedImageView != nil
        }
    @objc func imageTapped(_ gesture: UITapGestureRecognizer) {
            // Reset borders for all image views
        for imageView in skinImage {
            imageView.layer.borderWidth = 0
        }
        
        // Get the tapped image view
        if let tappedImageView = gesture.view as? UIImageView {
            // Highlight the tapped image view with a border
            tappedImageView.layer.borderColor = UIColor.brown.cgColor
            tappedImageView.layer.borderWidth = 2.0
            selectedImageView = tappedImageView // Set the selected image view
        }

        }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if isImageSelected() {
            // At least one image is selected, perform further actions
            // For example, dismiss the view controller or proceed to the next step
        } else {
            // No image is selected, show an alert
            let alertController = UIAlertController(title: "Alert", message: "Please choose your skin type. It helps us deliver to you better.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        performSegue(withIdentifier: "toTheSkinTypeSegue", sender: self)
        
    }
    @IBAction func unwindToSkinType(segue: UIStoryboardSegue) {
        
    
    }
    

}
