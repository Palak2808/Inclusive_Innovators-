//
//  ArticleTableViewCell.swift
//  FaceFlex
//
//  Created by student on 30/04/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var articleImage: UIImageView!
    
    
    @IBOutlet weak var articleName: UILabel!

    @IBOutlet weak var articleDescription: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
