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
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    
    
    
    func setup(_ item: ListItem) {
        wrinkleImage.image = UIImage(named: item.image)
        exerciseLabel.text = item.label1
        courseNameLabel.text = item.label2
        
        wrinkleImage.layer.cornerRadius = 15 // Adjust the corner radius as needed
                wrinkleImage.clipsToBounds = true
//        cellImageView.contentMode = .scaleAspectFill

    }
    
    
    
}
