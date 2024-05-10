//
//  QuickWorkoutsViewController.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit

class QuickWorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let quickInstance : [QuickWorkouts] = QuickWorkoutsManager.getQuickWorkouts()

    @IBOutlet weak var quickWorkoutsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quickInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = quickInstance[indexPath.row]
        let cell = quickWorkoutsTableView.dequeueReusableCell(withIdentifier: "quickCell", for: indexPath) as! QuickWorkoutsTableViewCell
        
        cell.qImage.image = UIImage(named: data.QuickImage)
        cell.qImage.layer.cornerRadius = 18
        //        cell.wrinkleImage.contentMode = .scaleAspectFill
        cell.qExercise.text = data.QuickExercise
        cell.qDescription.text = data.QuickDescription
        cell.qExercise.font = UIFont.systemFont(ofSize: 16)
        cell.qDescription.font = UIFont.systemFont(ofSize: 16)
            
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
