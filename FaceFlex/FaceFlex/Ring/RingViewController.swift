//
//  RingViewController.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit
import HealthKitUI

class RingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var ringTableView: UITableView! // Table view to display progress data
//    let ringInstance : [Ring] = RingManager.getRingManager()
    @IBOutlet weak var ringView: UIView! // View to display activity rings
    
    var ProgressInstance : [Progress] = [] // Array to store progress instances
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RingManager.shared.ringInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data =  RingManager.shared.ringInstance[indexPath.row] // Get data for the current row
        let cell = ringTableView.dequeueReusableCell(withIdentifier: "ringcell", for: indexPath) as! RingTableViewCell
        cell.weekTextLabel.text = data.description // Set the description text
        cell.titleLabel.text = data.title // Set the title text
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ringTableView.delegate = self
        ringTableView.dataSource = self
        // Configures the activity rings view with health data.
        let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200) )
                let summary = HKActivitySummary(); // Initialize activity summary
                
        // Calculate completed and total tasks
                let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
                let totalTasks: Double = Double(taskDataModel.getAllTasks().count)

                /// Creating Rring (Green)
                summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
                summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
                
                // Set the activity summary
                activityRingView.setActivitySummary(summary, animated: true)
                
        // Add activity ring view to ringView
              ringView.addSubview(activityRingView)
        
        self.ProgressInstance = taskDataModel.getAllTasks()

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
