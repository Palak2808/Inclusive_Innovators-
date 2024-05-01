//
//  ProfileViewController.swift
//  FaceFlex
//
//  Created by student on 26/04/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView:UITableView!
    let skinTypes = ["Oily", "Normal", "Combinational", "Dry"]
       let targetAreas = ["Face", "Body", "Both"]
       let courses = ["Course 1", "Course 2", "Course 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
     
        }
    }






extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Assuming you have 2 sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4 // 4 cells for section 1
        } else {
            return 2
        }
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 { // First section
            // Configure cells for section 1
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Name"
                // Assuming you have an IBOutlet for the label displaying the person's name
                // Replace "nameLabel" with your IBOutlet name
                let nameLabel = UILabel()
                nameLabel.text = "Klause"
                nameLabel.sizeToFit()
                cell.accessoryView = nameLabel // Display person's name on the right side
            case 1:
                cell.textLabel?.text = "Skin Type"
                // Configure accessory button for selecting skin type
                cell.accessoryType = .disclosureIndicator
            case 2:
                cell.textLabel?.text = "Target Areas"
                // Configure accessory button for selecting target areas
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.textLabel?.text = "Courses Active"
                // Configure accessory button for selecting courses active
                cell.accessoryType = .disclosureIndicator
            default:
                break
            }
        } else {
            // Configure cells for other sections
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Workout Time"
                // Assuming you have an IBOutlet for the label displaying workout time
                let accessoryButton = UIButton(type: .detailDisclosure)
                cell.accessoryView = accessoryButton // Display detail disclosure button
            case 1:
                cell.textLabel?.text = "Workout Days"
                // Assuming you have an IBOutlet for the label displaying workout days
                let accessoryButton = UIButton(type: .detailDisclosure)
                cell.accessoryView = accessoryButton // Display detail disclosure button
            default:
                break
            }
        }
        
        return cell
    }
        
        
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "Personal Details"
            } else {
                return "Notification details"
            }
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44 // Adjust height of cells as needed
        }
        
        //    public  func configureDropdown(for cell: UITableViewCell, withData data: [String]) {
        //        // Create a label for the detail text
        //        let detailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: cell.contentView.frame.height))
        //        detailLabel.textAlignment = .right // Align the detail text to the right
        //
        //        // Add the label to the cell's accessory view
        //        cell.accessoryView = detailLabel
        //
        //        // Assuming you set a unique tag for each cell, you can set the tag of the label accordingly
        //        detailLabel.tag = cell.tag
        //    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
