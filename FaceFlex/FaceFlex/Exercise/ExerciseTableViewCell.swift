//
//  ExerciseTableViewCell.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    
    @IBOutlet weak var exerciseName: UILabel!
    
    
    @IBOutlet weak var exerciseDescription: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
