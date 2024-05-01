//
//  CAdditionalSkincareollectionViewCell.swift
//  FaceFlex
//
//  Created by student on 29/04/24.
//

import UIKit

class CAdditionalSkincareollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var skincareName: UILabel!
    @IBOutlet weak var additionalImage: UIImageView!
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
                contentView.widthAnchor.constraint(equalToConstant: 120), // Set your desired width
                contentView.heightAnchor.constraint(equalToConstant: 150) // Set your desired height
            ])
        }
}
