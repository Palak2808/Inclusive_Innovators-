//
//  Week1TableViewController.swift
//  FaceFlex
//
//  Created by student on 13/05/24.
//

import UIKit

class Week1TableViewController: UITableViewController {
    
    @IBOutlet weak var weekLabel: UILabel!     // Label for displaying the week name
    
    @IBOutlet weak var weekIngredients: UILabel!   // Label for displaying the ingredients needed
    
    @IBOutlet weak var weekMethod: UILabel!    // Label for displaying the ingredients needed
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Label for displaying the ingredients needed
        let weekLabelText = "Rice Water Serum"   // Week name
        let weekIngredientsText = "Rice, Clean Water, Rose Water, Aloevera Gel"    // Ingredients needed
        let weekMethodText = "Soak 1 container of rice in a clean water, drain it twice. Add 1 tablespoon aloevera gel and 2-3 drops of rose water. Store in cool place for 15 days. Apply once a day."      // Method

        // Assign the texts to respective labels
        weekLabel.text = weekLabelText
        weekIngredients.text = weekIngredientsText
        weekMethod.text = weekMethodText

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

  
}
