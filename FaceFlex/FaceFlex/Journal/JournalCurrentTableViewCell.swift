//
//  JournalCurrentTableViewCell.swift
//  FaceFlex
//
//  Created by student on 09/05/24.
//

import UIKit

class JournalCurrentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DayLabel: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
