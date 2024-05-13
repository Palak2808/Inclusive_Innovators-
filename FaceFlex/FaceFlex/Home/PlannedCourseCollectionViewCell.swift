//
//  PlannedCourseCollectionViewCell.swift
//  FaceFlex
//
//  Created by student on 24/04/24.
//

import UIKit

class PlannedCourseCollectionViewCell: UICollectionViewCell {
  

    @IBOutlet weak var wrinkleImage: UIImageView!
    
 
    @IBOutlet weak var exerciseLabel: UILabel!
    

    @IBOutlet weak var courseName: UILabel!
    
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupContentViewConstraints()
        }
    // Required initialization method when creating cell from storyboard or xib
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupContentViewConstraints()
            applyGradient()
        }
    
    // Additional setup when the cell is loaded from the storyboard or xib
    override func awakeFromNib() {
        super.awakeFromNib()
        applyGradient()
        setupContentViewConstraints()
    }
    
    // Additional setup when the cell is loaded from the storyboard or xib
    private func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        // Define beige color
        let beigeColor = UIColor(red: 209/255, green: 196/255, blue: 183/255, alpha: 1.0) // Adjust RGB values as needed
        
        // Use beige color for the lightest shade
        gradientLayer.colors = [UIColor.white.cgColor, beigeColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.3, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    // Set up constraints for the cell's content view
        private func setupContentViewConstraints() {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: self.frame.size.width - 50), // Set your desired width
                contentView.heightAnchor.constraint(equalToConstant: 200) // Set your desired height
            ])
        }
}
