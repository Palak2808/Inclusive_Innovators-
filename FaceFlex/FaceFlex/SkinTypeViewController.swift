//
//  SkinTypeViewController.swift
//  FaceFlex
//
//  Created by student on 09/05/24.
//

import UIKit

class SkinTypeViewController: UIViewController{
    
    
    @IBOutlet var skinImage: [UIImageView]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            }
        }

}
