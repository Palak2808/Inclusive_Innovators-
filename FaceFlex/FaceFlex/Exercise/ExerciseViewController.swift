//
//  ExerciseViewController.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class ExerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
//    var ExercisesInstance : [Exercises] = ExerciseManager.getExercise()
    var selectedExerciseLabel :String?
    
    
    
    
    /// Navigates to the camera view controller.
    func navigateToCameraViewController() {
        // Instantiate the CameraViewController from storyboard
        if let cameraVC = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController {
            navigationController?.pushViewController(cameraVC, animated: true)
        }
    }
    /// Table view to display exercises.
    @IBOutlet weak var exerciseTableView: UITableView!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    /// Unwinds back to the source view controller when returning from another view controller.
    @IBAction func unwindToSourceViewController(segue: UIStoryboardSegue) {
        
        exerciseTableView.reloadData()
    }
    
    /// Returns the number of rows in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        ExercisesInstance.count
        ExerciseManager.shared.ExercisesInfo.count
    }
    
    
    
    /// Handles row selection in the table view.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedText = ExerciseManager.shared.ExercisesInfo[indexPath.row]
        performSegue(withIdentifier: "ExerciseToCameraSegue", sender: selectedText)
    }
    
    
    
    
    
    /// Configures and returns a cell for the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = ExerciseManager.shared.ExercisesInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
        
        // Set exercise details
        cell.exerciseImage.image = UIImage(named: data.exerciseImage)
        cell.exerciseName.text = data.exerciseHeadingText
        cell.exerciseDescription.text = data.exerciseDescriptionText
        
        // Reduce font size for exerciseName label
        cell.exerciseName.font = UIFont.systemFont(ofSize: 16) // Adjust the font size as needed
        
        // Reduce font size for exerciseDescription label
        cell.exerciseDescription.font = UIFont.systemFont(ofSize: 14) // Adjust the font size as needed
        
        // Check if the exercise is completed, and update the accessory type
        if ExerciseManager.shared.isExerciseDone(name: data.exerciseHeadingText) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }

    /// Prepares for segue navigation.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExerciseToCameraSegue" {
            if let cameraVC = segue.destination as? CameraViewController,
               let selectedExercise = sender as? Exercises {
                // Pass the selected exercise label to the CameraViewController
                cameraVC.selectedExerciseLabel = selectedExercise.exerciseHeadingText
            }
        }
    }
}


