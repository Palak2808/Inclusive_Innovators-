//
//  PlannedCourseCollectionViewCell.swift
//  FaceFlex
//
//  Created by student on 24/04/24.
//

import UIKit
class GradientCollectionViewCell: UICollectionViewCell {
override func awakeFromNib() {
    super.awakeFromNib()
    applyGradient()
}

private func applyGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // Customize gradient colors as needed
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    self.layer.insertSublayer(gradientLayer, at: 0)
}
}

class PlannedCourseCollectionViewCell: UICollectionViewCell {
  

    @IBOutlet weak var wrinkleImage: UIImageView!
    
 
    @IBOutlet weak var exerciseLabel: UILabel!
    

    @IBOutlet weak var courseName: UILabel!
    
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupContentViewConstraints()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupContentViewConstraints()
        }

        private func setupContentViewConstraints() {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: self.frame.size.width - 50), // Set your desired width
                contentView.heightAnchor.constraint(equalToConstant: 200) // Set your desired height
            ])
            
            
//            
//            wrinkleImage.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(wrinkleImage)
//            exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
//                   contentView.addSubview(exerciseLabel)
//            courseNameLabel.translatesAutoresizingMaskIntoConstraints = false
//                   contentView.addSubview(courseNameLabel)
        }
    
   // func setup(_ item: ListItem) {
      //  wrinkleImage.image = UIImage(named: item.image)
     //   exerciseLabel.text = item.label1
       
//        
//        wrinkleImage.layer.cornerRadius = 15 // Adjust the corner radius as needed
//        wrinkleImage.clipsToBounds = true
//        
//        
//        
//
//    }
    
    
    
}
