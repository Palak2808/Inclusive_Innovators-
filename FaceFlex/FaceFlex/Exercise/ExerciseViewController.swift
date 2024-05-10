//
//  ExerciseViewController.swift
//  FaceFlex
//
//  Created by student on 02/05/24.
//

import UIKit

class ExerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var ExercisesInstance : [Exercises] = ExerciseManager.getExercise()
    
    


    func navigateToCameraViewController() {
        // Instantiate the CameraViewController from storyboard
        if let cameraVC = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController {
            navigationController?.pushViewController(cameraVC, animated: true)
        }
    }

    

    
    @IBOutlet weak var exerciseTableView: UITableView!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
           // Update the completed status of the corresponding exercise (assuming you have the index or identifier of the exercise)
           // For example, let's say you want to mark the first exercise as completed
           let firstExerciseIndex = 0
           if firstExerciseIndex < ExercisesInstance.count {
               ExercisesInstance[firstExerciseIndex].completed = true
               // Reload the table view to reflect the changes
               exerciseTableView.reloadData()
           }
       }
    @IBAction func unwindToSourceViewController(segue: UIStoryboardSegue) {
        // Add any necessary code to handle the unwind action
        exerciseTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ExercisesInstance.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        count+=1
           let data = ExercisesInstance[indexPath.row]
           let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
           cell.exerciseImage.image = UIImage(named: data.exerciseImage)
           cell.exerciseName.text = data.exerciseHeadingText
           cell.exerciseDescription.text = data.exerciseDescriptionText
           
           // Reduce font size for exerciseName label
           cell.exerciseName.font = UIFont.systemFont(ofSize: 16) // Adjust the font size as needed
           
           // Reduce font size for exerciseDescription label
           cell.exerciseDescription.font = UIFont.systemFont(ofSize: 14) // Adjust the font size as needed
           
           // Set disclosure accessory button
        if(data.completed == false){
            cell.accessoryType = .disclosureIndicator}
        else{
            cell.accessoryType = .checkmark
        }
        
        
           
           return cell
       }
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


//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let alert = UIAlertController(title: "Continue Exercise?", message: "Do you want to continue with this exercise?", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
//                self.navigateToCameraViewController()
//            }))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            present(alert, animated: true, completion: nil)
//        }
//
//    func navigateToCameraViewController() {
//            // Instantiate the CameraViewController from storyboard
//            if let cameraVC = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController {
//                navigationController?.pushViewController(cameraVC, animated: true)
//            }
//        }
//
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let alert = UIAlertController(title: "Continue Exercise?", message: "Do you want to continue with this exercise?", preferredStyle: .alert)
////        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
////            self.navigateToCameraViewController()
////        }))
////        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
////        present(alert, animated: true, completion: nil)
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let data = ExercisesInstance[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
//        cell.exerciseImage.image = UIImage(named: data.exerciseImage)
//        cell.exerciseName.text = data.exerciseHeadingText
//        cell.exerciseDescription.text = data.exerciseDescriptionText
//
//        // Reduce font size for exerciseName label
//            cell.exerciseName.font = UIFont.systemFont(ofSize: 16) // Adjust the font size as needed
//
//            // Reduce font size for exerciseDescription label
//            cell.exerciseDescription.font = UIFont.systemFont(ofSize: 14) // Adjust the font size as needed
//
//        // Set disclosure accessory button
//            cell.accessoryType = .disclosureIndicator
//
//        return cell
//
//    }
