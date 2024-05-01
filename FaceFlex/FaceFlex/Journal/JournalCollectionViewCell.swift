//
//  JournalCollectionViewCell.swift
//  FaceFlex
//
//  Created by student on 30/04/24.
//

import UIKit

class JournalCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var dayName: UILabel!
    
    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 361), // Set your desired width
            contentView.heightAnchor.constraint(equalToConstant: 215) // Set your desired height
        ])
    }
}
