//
//  RingTableViewCell.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit

class RingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var weekTextLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
