//
//  PreviousWeeksViewController.swift
//  FaceFlex
//
//  Created by student on 01/05/24.
//

import UIKit
import FSCalendar
class PreviousWeeksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   
    @IBOutlet weak var momentsTableView: UITableView!
    let MomentsInstance : [Moments] = MomentsManager.getAllMoments()
    var capturedImage: UIImage?
     var selectedDate: Date?
 
        override func viewDidLoad() {
            super.viewDidLoad()

            momentsTableView.reloadData()

        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MomentsInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = MomentsInstance[indexPath.row]
        let cell = momentsTableView.dequeueReusableCell(withIdentifier: "MomentCell", for: indexPath) as! MomentTableViewCell
        cell.momentImage.image = UIImage(named: data.image)
        cell.momentDay.text = data.weekDay
        cell.momentDescription.text = data.description
        cell.momentImage.contentMode = .scaleAspectFit
        // Display captured image in the first row if available
        if let image = capturedImage, indexPath.row == 0 {
                   cell.momentImage.image = image
               }
               
               // Set the selected date to the first label
        if indexPath.row == 0, let date = selectedDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            cell.momentDay.text = dateFormatter.string(from: date)
            print("Even the text has been set now")
        }
        
        return cell
    }
    
    
}




















