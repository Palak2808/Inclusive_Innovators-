//
//  ExerciseTableViewCell.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    /// Image view to display exercise image.
    @IBOutlet weak var exerciseImage: UIImageView!
    
    /// Label to display exercise name.
    @IBOutlet weak var exerciseName: UILabel!
    
    /// Label to display exercise description.
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
