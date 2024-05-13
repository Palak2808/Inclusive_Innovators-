//
//  QuickWorkoutsTableViewCell.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit

class QuickWorkoutsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var qExercise: UILabel!
    
    @IBOutlet weak var qDescription: UILabel!
    
    @IBOutlet weak var qImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
