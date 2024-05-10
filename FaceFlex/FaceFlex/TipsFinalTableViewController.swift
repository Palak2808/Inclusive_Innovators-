//
//  TipsFinalTableViewController.swift
//  FaceFlex
//
//  Created by student on 10/05/24.
//

import UIKit

class TipsFinalTableViewController: UITableViewController {
    
    @IBOutlet weak var tipImage: UIImageView!
    
    @IBOutlet weak var tipName: UILabel!
    
    @IBOutlet weak var tipIngredients: UILabel!
    
    
    @IBOutlet weak var tipMethod: UILabel!
    

    let WeeklyInstance : [WeeklyTips] = WeeklyTipManager.getWeeklyTip()
    
    var selectedTipLabel: String?
        var selectedTip: WeeklyTips?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let selectedWeekNumber = selectedTipLabel {
                // Find the matching tip from WeeklyTipsManager
                if let matchedTip = WeeklyTipManager.WeeklyInstance.first(where: { $0.weekNumber == selectedWeekNumber }) {
                    // Set the selected tip
                    selectedTip = matchedTip
                    
                    // Update UI with selected tip details
                    tipImage.image = UIImage(named: matchedTip.tipImage)
                    tipName.text = matchedTip.tipDescription
                    tipIngredients.text = matchedTip.ingredientsNeeded
                    tipMethod.text = matchedTip.method
                } else {
                    // Handle case where no matching tip is found
                    print("Tip not found for week number: \(selectedWeekNumber)")
                }
            }
        }

  
}
