//
//  MomentTableViewCell.swift
//  FaceFlex
//
//  Created by student on 30/04/24.
//

import UIKit

class MomentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var momentImage: UIImageView!
    
    @IBOutlet weak var momentDay: UILabel!
    
    @IBOutlet weak var momentDescription: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
