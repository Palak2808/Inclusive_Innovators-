//
//  AllWeeklyTipsTableViewCell.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import UIKit

class AllWeeklyTipsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var allWeeklyImage: UIImageView!   // Image view for displaying the tip image
    
    @IBOutlet weak var allWeeklyLabel: UILabel!    // Label for displaying the week number
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
