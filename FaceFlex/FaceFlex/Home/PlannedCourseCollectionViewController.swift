//
//  PlannedCourseCollectionViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit
import HealthKitUI


class PlannedCourseCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var articleTableView: UITableView!
    
    @IBOutlet weak var mainView: UIView!
    
    var PlannedCourses : [Course] = PlannedCourseManger.getPlannedCourseDetails()
    var ProgressInstance : [Progress] = []; var completedTasks : [Progress] = [];var pendingTasks: [Progress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
       // collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        
        /// Create the Activity Ring
        let activityRingView = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80) )
                let summary = HKActivitySummary();
                
                let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
                let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
                
                // Create the sepeerate file for creating the ring
                /// Creating Rring (Green)
                summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
                summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
                
                /// Set the activity summary
                activityRingView.setActivitySummary(summary, animated: true)
                
              mainView.addSubview(activityRingView)
        
        self.ProgressInstance = taskDataModel.getAllTasks()
      //  activityRingView.fillColor = UIColor.red
//               let completedTasksCount = ProgressInstance.filter({$0.isCompleted}).count
               
               // Cahnge the string and store in file
//               completedTaskLabel?.text = " \(completedTasksCount)/\(ProgressInstance.count) Tasks Completed"
//               ongoingTaskLabel?.text = " \(ProgressInstance[0].weekNumber)"
//               upcomingTaskLabel?.text = "\(ProgressInstance[1].weekNumber)"
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticleInfo.count
    }
    
//    func generateLayout() -> UICollectionViewLayout {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,repeatingSubitem: item,count:2)
//        let spacing = CGFloat(20)
//        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: 0, bottom: 0, trailing: 0)
//        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(spacing)
//        let section = NSCollectionLayoutSection(group: group)
//        
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        
//        return layout
//    }
    
    
    
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
    
//    let articleImageArray = ["image4","w4"]
//    let title2 : [String] = ["Facial Exercise Impacts","Do's and Dont's"]
//    let description2 : [String] = ["Checkout","Read Now"]
    
    var ArticleInfo : [Article] = ArticleManager.getArticle()
    
    
    let urls = ["https://google.com", "https://facebook.com"] // Your array of URLs
       
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let pic = articleImageArray[indexPath.row]
        let data = ArticleInfo[indexPath.row]
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.articleName.text = data.headingText
        cell.articleDescription.text = data.descriptionText
        cell.articleImage.image = UIImage(named: data.articleImage)
        cell.articleImage.layer.cornerRadius = 18
        cell.articleImage.contentMode = .scaleToFill
        
      // Just a placeholder text
       
        
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
//          let completedTasksCount = self.tasks.filter({$0.isCompleted}).count
//          
//          completedTaskLabel?.text = "⭐️ \(completedTasksCount)/\(tasks.count) Tasks Completed"
//          ongoingTaskLabel?.text = "\(tasks[0].emoji) \(tasks[0].title)"
//          upcomingTaskLabel?.text = "\(tasks[1].emoji) \(tasks[1].title)"
      }
      
}
