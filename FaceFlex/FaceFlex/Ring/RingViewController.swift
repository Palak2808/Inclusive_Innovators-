//
//  RingViewController.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit
import HealthKitUI

class RingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var ringTableView: UITableView!
    let ringInstance : [Ring] = RingManager.getRingManager()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ringInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = ringInstance[indexPath.row]
        let cell = ringTableView.dequeueReusableCell(withIdentifier: "ringcell", for: indexPath) as! RingTableViewCell
        cell.weekTextLabel.text = data.description
        cell.titleLabel.text = data.title
//        cell.performanceTextLabel.text = data.performance
//        cell.courseTextLabel.text = data.courseName
        return cell
    }
    

    
    
    @IBOutlet weak var ringView: UIView!
    
    var ProgressInstance : [Progress] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ringTableView.delegate = self
        ringTableView.dataSource = self
        let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200) )
                let summary = HKActivitySummary();
                
                let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
                let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
                
                // Create the sepeerate file for creating the ring
                /// Creating Rring (Green)
                summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
                summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
                
                /// Set the activity summary
                activityRingView.setActivitySummary(summary, animated: true)
                
              ringView.addSubview(activityRingView)
        
        self.ProgressInstance = taskDataModel.getAllTasks()
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let summary = HKActivitySummary();
        let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
        let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
        
        let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200) )
        
        /// Creating Rring (Red)
        summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
        summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
        
        /// Set the activity summary
        activityRingView.setActivitySummary(summary, animated: true)
        
        ringView.addSubview(activityRingView)
        
        // MARK: - Changing the Activity Details
        ProgressInstance = taskDataModel.getAllTasks()
    }



}
