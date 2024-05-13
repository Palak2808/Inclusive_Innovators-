//
//  TipsFinalTableViewController.swift
//  FaceFlex
//
//  Created by student on 10/05/24.
//

import UIKit

class TipsFinalTableViewController: UITableViewController {
    
    @IBOutlet weak var tipImage: UIImageView!     // Image view for displaying the tip image
    
    @IBOutlet weak var tipName: UILabel!        // Label for displaying the tip name
    
    @IBOutlet weak var tipIngredients: UILabel!  // Label for displaying the ingredients needed
    
    
    @IBOutlet weak var tipMethod: UILabel!    // Label for displaying the tip method
    

    let WeeklyInstance : [WeeklyTips] = WeeklyTipManager.getWeeklyTip()  // Array to store weekly tips
    
    var selectedTipLabel: String?  // Label of the selected tip
        var selectedTip: WeeklyTips?  // Selected weekly tip object
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Update UI with details of the selected tip
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
