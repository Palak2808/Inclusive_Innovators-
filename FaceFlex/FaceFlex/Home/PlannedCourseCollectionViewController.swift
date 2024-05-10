//
//  PlannedCourseCollectionViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit
import HealthKitUI


class PlannedCourseCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
 
    @IBOutlet weak var completedTask: UILabel!
    
    @IBOutlet weak var completedTaskLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var articleTableView: UITableView!
    
    @IBOutlet weak var mainView: UIView!
    
    var PlannedCourses : [Course] = PlannedCourseManger.getPlannedCourseDetails()
    var ProgressInstance : [Progress] = []; var completedTasks : [Progress] = [];var pendingTasks: [Progress] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        
        /// Create the Activity Ring
        let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80) )
                let summary = HKActivitySummary();
                
          let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({ $0.isCompleted }).count)
                let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
                
                // Create the sepeerate file for creating the ring
                /// Creating Rring (Green)
                summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
                summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
                
                /// Set the activity summary
                activityRingView.setActivitySummary(summary, animated: true)
                
              mainView.addSubview(activityRingView)
        
        self.ProgressInstance = taskDataModel.getAllTasks()
        let completedTasksCount = ProgressInstance.filter({$0.isCompleted}).count
        
        // Cahnge the string and store in file
        completedTaskLabel?.text = "⭐️ \(completedTasksCount)/\(ProgressInstance.count) Tasks Completed"
 
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticleInfo.count
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PlannedCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = PlannedCourses[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PlannedCourseCollectionViewCell
        
        cell.wrinkleImage.image = UIImage(named: data.image)
        //        cell.wrinkleImage.contentMode = .scaleAspectFill
        cell.courseName.text = data.name
        cell.exerciseLabel.text = data.exerciseNumber
        cell.wrinkleImage.contentMode = .scaleAspectFit
        cell.wrinkleImage.clipsToBounds = true
        return cell
    }
 
    
    var ArticleInfo : [Article] = ArticleManager.getArticle()
    
    
    let urls = ["https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5885810/", "https://www.vogue.in/content/a-guide-to-face-yoga-for-a-healthy-sculpted-glow"] // Your array of URLs
       
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let pic = articleImageArray[indexPath.row]
        let data = ArticleInfo[indexPath.row]
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.articleName.text = data.headingText
        cell.articleDescription.text = data.descriptionText
        cell.articleImage.image = UIImage(named: data.articleImage)
        cell.articleImage.layer.cornerRadius = 18
        cell.articleImage.contentMode = .scaleToFill

        return cell
        //    }
        
    }

    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let urlString = urls[indexPath.row]
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    // WEEKLY PROGRESS------------------------
    
    override func viewWillAppear(_ animated: Bool) {
          let summary = HKActivitySummary();
          let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
          let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
          
          let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80) )
          
          /// Creating Rring (Red)
          summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
          summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
          
          /// Set the activity summary
          activityRingView.setActivitySummary(summary, animated: true)
          
          mainView.addSubview(activityRingView)
          
          // MARK: - Changing the Activity Details
         ProgressInstance = taskDataModel.getAllTasks()


    }
    
}
//    @objc func imageTap() {
//        /// or push to the navigation stack
//        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Task List") as! RingViewController
//
//        navigationController?.pushViewController(destinationVC, animated: true)
//        mainView.isUserInteractionEnabled = true
//        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
       // activityRingView.fillColor = UIColor.brown
//               let completedTasksCount = ProgressInstance.filter({$0.isCompleted}).count
               
               // Cahnge the string and store in file
//               completedTaskLabel?.text = " \(completedTasksCount)/\(ProgressInstance.count) Tasks Completed"
//               ongoingTaskLabel?.text = " \(ProgressInstance[0].weekNumber)"
//               upcomingTaskLabel?.text = "\(ProgressInstance[1].weekNumber)"
       
