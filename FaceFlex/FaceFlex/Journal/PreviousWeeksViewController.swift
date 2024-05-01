//
//  PreviousWeeksViewController.swift
//  FaceFlex
//
//  Created by student on 01/05/24.
//

import UIKit

class PreviousWeeksViewController: UIViewController {
    
    

    @IBOutlet weak var journalCollectionView: UICollectionView!
    
    @IBOutlet weak var momentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let momentDayArray:[String] = ["Monday","Tuesday"]
        let momentImageArray :[String] = ["moment1","image2"]
        let momentDescriptionArray:[String] = ["Feeling fresh","Feeling better skin"]
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return momentDayArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //let pic = articleImageArray[indexPath.row]
            let cell = momentTableView.dequeueReusableCell(withIdentifier: "MomentCell", for: indexPath) as! MomentTableViewCell
            cell.momentDay.text = momentDayArray[indexPath.row]
            cell.momentDescription.text = momentDescriptionArray[indexPath.row]
            cell.momentImage.image = UIImage(named:momentImageArray[indexPath.row])
         
            cell.momentImage.contentMode = .scaleAspectFit
            
            
            return cell
        }
    

}
