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
        let activityRingView = HKActivityRingView(frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80))

        // Calculate the percentage of completed tasks
        let completedTasks: Double = Double(RingManager.shared.exerciseCompleted)
        let totalTasks: Double = Double(4)
        let completionPercentage = completedTasks / totalTasks

        // Set the progress for the activity ring
        activityRingView.setActivitySummary(
            HKActivitySummary(),
            animated: true
        )

        mainView.addSubview(activityRingView)

        // Update the label to show completed tasks
        completedTaskLabel?.text = "⭐️ \(Int(completedTasks))/\(Int(totalTasks)) Tasks Completed"

 
        
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
        let activityRingView = HKActivityRingView(frame: CGRect(x: 0.0, y: 0.0, width: 80, height: 80))

        // Calculate the percentage of completed tasks
        let completedTasks: Double = Double(RingManager.shared.exerciseCompleted)
        let totalTasks: Double = Double(4)
        let completionPercentage = completedTasks / totalTasks

        // Set the progress for the activity ring
        activityRingView.setActivitySummary(
            HKActivitySummary(),
            animated: true
        )

        mainView.addSubview(activityRingView)

        // Update the label to show completed tasks
        completedTaskLabel?.text = "⭐️ \(Int(completedTasks))/\(Int(totalTasks)) Tasks Completed"
        

    }
    
} 
