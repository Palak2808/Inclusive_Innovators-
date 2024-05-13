

import UIKit

class QuickWorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // An array of QuickWorkouts instances representing the available quick workouts.
    let quickInstance : [QuickWorkouts] = QuickWorkoutsManager.getQuickWorkouts()

    // MARK: - Outlets
    @IBOutlet weak var quickWorkoutsTableView: UITableView! // Table view to display quick workouts
    
    // MARK: - View Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Additional setup can be done here
        }
        
        // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quickInstance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = quickInstance[indexPath.row]
        let cell = quickWorkoutsTableView.dequeueReusableCell(withIdentifier: "quickCell", for: indexPath) as! QuickWorkoutsTableViewCell
        
        
        // Configure cell with quick workout data
        cell.qImage.image = UIImage(named: data.QuickImage)
        cell.qImage.layer.cornerRadius = 18
        cell.qExercise.text = data.QuickExercise
        cell.qDescription.text = data.QuickDescription
        cell.qExercise.font = UIFont.systemFont(ofSize: 16)
        cell.qDescription.font = UIFont.systemFont(ofSize: 16)
            
        return cell
    }
    let videoNames = ["video.mp4","videoo.mp4","video2.mp4","video2.mp4","video2.mp4"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? videoViewController,
             let selectedCell = sender as? UITableViewCell,
             let indexPath = quickWorkoutsTableView.indexPath(for: selectedCell) {
              
              // Assuming you have an array of video names called "videoNames"
            // Get the video name corresponding to the selected cell
              let videoName = videoNames[indexPath.section]
              destinationViewController.video = videoName
          }
    }

}
