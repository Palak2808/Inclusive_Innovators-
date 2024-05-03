//
//  AllWeeklyTipsViewController.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import UIKit

class AllWeeklyTipsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let AllWeeklyInstance : [AllWeeklyTips] = AllWeeklyTipsManager.getAllWeeklyTips()
  
    
    @IBOutlet weak var AllWeeklyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AllWeeklyTableView.dataSource = self
        AllWeeklyTableView.delegate = self
        
       // data.allWeeklyImage.layer.cornerRadius = 50
       // imageView.layer.masksToBounds = true
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllWeeklyInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = AllWeeklyInstance[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "allWeeklyCell", for: indexPath) as! AllWeeklyTipsTableViewCell
        cell.allWeeklyImage.image = UIImage(named: data.allWeeklyImage)
        cell.allWeeklyLabel.text = data.weekNumber
        cell.allWeeklyImage.layer.cornerRadius = 20
        cell.allWeeklyImage.layer.masksToBounds = true
       
        return cell
        
    }


}
