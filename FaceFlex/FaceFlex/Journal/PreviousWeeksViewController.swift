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
//            momentsTableView.reloadData()
            momentsTableView.reloadData()

    
            // Do any additional setup after loading the view.
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
        
       // momentsTableView.reloadData()
        
        return cell
    }
    
    
}





















//    @IBOutlet weak var momentsView: UICollectionView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        momentsView.delegate = self
//        momentsView.dataSource = self
//
//        // Do any additional setup after loading the view.
//    }
//    
////    let momentDayArray:[String] = ["Monday","Tuesday","Wednesday"]
////        let momentImageArray :[String] = ["moment1","image2","image3"]
////        let momentDescriptionArray:[String] = ["Feeling fresh","Feeling better skin","Loved the session"]
//        
//        
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return MomentsInstance.count
//        }
//        
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//            //let pic = articleImageArray[indexPath.row]
//        let data = MomentsInstance[indexPath.row]
//            let cell = momentsView.dequeueReusableCell(withReuseIdentifier: "MomentCell", for: indexPath) as! MomentsCollectionViewCell
//        cell.dayLabel.text = data.weekDay
//        cell.momentDescription.text = data.description
//        cell.momentImage.image = UIImage(named:data.image)
//         
//           // cell.momentImage.contentMode = .scaleAspectFit
//            
//            
//            return cell
        
