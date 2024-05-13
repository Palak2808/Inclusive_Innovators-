//
//  AllWeeklyTipsViewController.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import UIKit

class AllWeeklyTipsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let AllWeeklyInstance : [AllWeeklyTips] = AllWeeklyTipsManager.getAllWeeklyTips()   // Array to store all weekly tips
   // let AllWeeklyInstanceDetail :[String] = AllWeeklyTipsManagerDetail.getAllWeeklyTipsDetail()
    var selectedIndex:Int?    // Index of the selected table view cell
    var count = 0;    // Counter for tracking index
    @IBOutlet weak var AllWeeklyTableView: UITableView!    // Table view to display all weekly tips
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Set data source and delegate for table view
        AllWeeklyTableView.dataSource = self
        AllWeeklyTableView.delegate = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllWeeklyInstance.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure table view cell
        selectedIndex = count
        count+=1;
        
        let data = AllWeeklyInstance[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "allWeeklyCell", for: indexPath) as! AllWeeklyTipsTableViewCell
        cell.allWeeklyImage.image = UIImage(named: data.allWeeklyImage)
        cell.allWeeklyLabel.text = data.weekNumber
        // Reducing the text size
        cell.allWeeklyLabel.font = UIFont.systemFont(ofSize: 16)
        cell.allWeeklyImage.layer.cornerRadius = 20
        cell.allWeeklyImage.layer.masksToBounds = true
       
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(index!)
        
        if segue.identifier == "TipDetailedSegue" {
                if let destinationVC = segue.destination as? TipsFinalTableViewController {
                    if let cell = sender as? AllWeeklyTipsTableViewCell {
                        if let indexPath = AllWeeklyTableView.indexPath(for: cell) {
                            // Get the selected data from AllWeeklyInstance
                            // Pass the selected tip label to the destination view controller
                            let selectedItem = AllWeeklyInstance[indexPath.row]
                            // Pass the label text to the destination view controller
                            destinationVC.selectedTipLabel = selectedItem.weekNumber
                        }
                    }
                }
            }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TipDetailedSegue" {
//               if let destinationVC = segue.destination as? FurtherTipViewController {
//                   if let cell = sender as? AllWeeklyTipsTableViewCell { // Assuming your custom cell class is named AllWeeklyTipsTableViewCell
//                       if let indexPath = AllWeeklyTableView.indexPath(for: cell) { // Accessing the tableView property to get the indexPath
//                           let selectedItem = AllWeeklyInstanceDetail[indexPath.row]
//                          
//                           let components = selectedItem.components(separatedBy: ",")
//                           // Now, 'components' is an array containing each part of the skincare tip separated by commas
//                           destinationVC.selectedTipData = components
//                           
//                        /// Now that i have an array where
//                           
//                       }
//                   }
//               }
//           }
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TipDetailedSegue" {
//            if let destinationVC = segue.destination as? FurtherTipViewController {
//                if let cell = sender as? AllWeeklyTipsTableViewCell {
//                    if let indexPath = AllWeeklyTableView.indexPath(for: cell) {
//                        let selectedItem = AllWeeklyInstanceDetail[indexPath.row]
//                        let components = selectedItem.components(separatedBy: ",")
//                        destinationVC.selectedTipData = components
//                    }
//                }
//            }
//        }
//    }


}
