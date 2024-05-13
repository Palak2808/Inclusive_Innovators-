//
//  GoalViewController.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class GoalViewController: UIViewController {
    /// Array of UIImageViews representing desired goals.
    @IBOutlet var desiredGoal: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        applyCornerRadiusToImageViews()
        /// Sets up tap gesture recognizers for each UIImageView.
        for imageView in desiredGoal {
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
                    imageView.isUserInteractionEnabled = true
                    imageView.addGestureRecognizer(tapGesture)
                }
        
    }
    
    func applyCornerRadiusToImageViews() {
        // Apply corner radius to each UIImageView in the outlet collection
        for imageView in desiredGoal {
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
        }
    }
    
    
    
    
    /// Handles tap gesture on the UIImageViews.
       ///
       /// - Parameter gesture: The UITapGestureRecognizer object.
    @objc func imageTapped(_ gesture: UITapGestureRecognizer) {
            // Reset borders for all image views
            for imageView in desiredGoal {
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
