//
//  WorkoutsCollectionViewCell.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit

class WorkoutsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var workoutImage: UIImageView!
    
    @IBOutlet weak var workoutLabel: UILabel!
    
    @IBOutlet weak var numberOfExerciseLabel: UILabel!
    
    

    
    
    
    
    
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
            contentView.widthAnchor.constraint(equalToConstant: 150), // Set your desired width
            contentView.heightAnchor.constraint(equalToConstant: 170) // Set your desired height
        ])
    }
}
