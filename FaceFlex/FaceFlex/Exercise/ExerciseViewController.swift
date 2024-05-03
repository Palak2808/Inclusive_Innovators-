//
//  ExerciseViewController.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class ExerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exerciseNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
        cell.exerciseImage.image = UIImage(named: exerciseImageArray[indexPath.row])
        cell.exerciseName.text = exerciseNameArray[indexPath.row]
        cell.exerciseDescription.text = exerciseDescriptionArray[indexPath.row]
        
        
        
        return cell
        
    }
    
    let exerciseImageArray :[String] = ["exercise1","exercise1",
    "exercise1","exercise1"]
    let exerciseNameArray:[String] = ["Pucker Up","Mewing","Pucker Up","Mewing"]
    let exerciseDescriptionArray:[String] = ["No of strokes-5","No of strokes-5","No of strokes-2","No of strokes-3"]
    
    @IBOutlet weak var exerciseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
