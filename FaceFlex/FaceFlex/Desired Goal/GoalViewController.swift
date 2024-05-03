//
//  GoalViewController.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class GoalViewController: UIViewController {
    
    @IBOutlet var desiredGoal: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        applyCornerRadiusToImageViews()
            }
            
            func applyCornerRadiusToImageViews() {
                // Apply corner radius to each UIImageView in the outlet collection
                for imageView in desiredGoal {
                    imageView.layer.cornerRadius = 20
                    imageView.layer.masksToBounds = true
                }
            }
    

   

}
